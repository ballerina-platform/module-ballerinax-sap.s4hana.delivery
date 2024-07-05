// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/time;
import ballerinax/googleapis.gmail as gmail;
import ballerinax/sap.s4hana.api_customer_returns_delivery_srv_0002 as returnDel;

configurable S4hanaClientConfig s4hanaClientConfig = ?;

returnDel:Client returnDelClient = check new (config = {
        auth: {
            username: s4hanaClientConfig.username,
            password: s4hanaClientConfig.password
        }
    },
    hostname = s4hanaClientConfig.hostname
);

configurable GmailClientConfig gmailClientConfig = ?;

gmail:Client gmail = check new gmail:Client(
    config = {
        auth: {
            refreshToken: gmailClientConfig.refreshToken,
            clientId: gmailClientConfig.clientId,
            clientSecret: gmailClientConfig.clientSecret
        }
    }
);

public function main() returns error? {

    string query = "CreationDate gt datetime'" + getStartOfWeekTimestamp() + "'";

    returnDel:CollectionOfA_ReturnsDeliveryItemWrapper response = check returnDelClient->listA_ReturnsDeliveryItems(\$filter = query);
    returnDel:A_ReturnsDeliveryItem[] returnedDeliveries = response.d?.results ?: [];

    if returnedDeliveries.length() == 0 {
        io:println("No returns deliveries found for the week");
        return;
    }

    string|error report = generateReport(returnedDeliveries);

    if (report is error) {
        io:println(string `Error while generating report, ${report.message()}`);
        return;
    }

    gmail:MessageRequest message = {
        to: [gmailClientConfig.recipientAddress],
        'from: gmailClientConfig.fromAddress,
        subject: "Weekly Customer Returns Delivery Report",
        bodyInHtml: report
    };

    _ = check gmail->/users/me/messages/send.post(message);
    io:println("Weekly Report Sent Successfully!");
}

function generateReport(returnDel:A_ReturnsDeliveryItem[] returnsList) returns string|error {

    record {|string? Material; [string?...] DeliveryDocument; int ActualDeliveryQuantity;|}[] groupedItems =
        from var {Material, DeliveryDocument, ActualDeliveryQuantity} in returnsList
    let int quantity = check int:fromString(ActualDeliveryQuantity ?: "0")
    group by Material
    select {
        Material,
        DeliveryDocument: [DeliveryDocument],
        ActualDeliveryQuantity: sum(quantity)
    };

    string[] tableRows = from var Item in groupedItems
        select string `<tr><td>${Item.Material ?: ""}</td><td>${Item.DeliveryDocument.toString()}</td><td>${Item.ActualDeliveryQuantity.toString()}</td></tr>`;

    string emailTemplate = string `<p>This is an automated delivery report generated to provide detailed information on the materials, delivery documents, and quantities for each product.</p>
                                        <table border='1'>
                                        <tr><th>Product</th><th>Delivery Document</th><th> Delivered Quantity</th></tr>
                                        ${tableRows.reduce(function(string result, string val) returns string => result + val, "")}
                                        </table>`;
    return emailTemplate;
}

public function getStartOfWeekTimestamp() returns string {
    time:Utc currentUtc = time:utcNow();
    time:Utc utc = time:utcAddSeconds(currentUtc, -7 * 24 * 60 * 60);
    return time:utcToString(utc).substring(0, 19);
}
