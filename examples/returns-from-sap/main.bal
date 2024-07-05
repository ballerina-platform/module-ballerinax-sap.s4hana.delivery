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

configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

returnDel:ConnectionConfig config = {
    auth: {
        username: username,
        password: password
    }
};

configurable string refreshToken = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string recipientAddress = ?;
configurable string fromAddress = ?;

gmail:Client gmail = check new gmail:Client(
    config = {
        auth: {
            refreshToken,
            clientId,
            clientSecret
        }
    }
);

public function main() returns error? {

    returnDel:Client returnDelClient = check new (config, hostname);
    string query = "CreationDate gt datetime'" + getStartOfWeekTimestamp() + "'";

    returnDel:CollectionOfA_ReturnsDeliveryItemWrapper returnsDeliveries = check returnDelClient->listA_ReturnsDeliveryItems(\$filter = query);

    string report = generateReport(returnsDeliveries);

    gmail:MessageRequest message = {
        to: [recipientAddress],
        'from: fromAddress,
        subject: "Weekly Customer Returns Delivery Report",
        bodyInHtml: report
    };

    gmail:Message sendResult = check gmail->/users/me/messages/send.post(message);
    io:println(sendResult);
}

// Function to generate the report
function generateReport(returnDel:CollectionOfA_ReturnsDeliveryItemWrapper returnsDeliveries) returns string {
    string tableStart = "<table border='1'><tr><th>Product</th><th>Delivery Document</th><th> Delivered Quantity</th></tr>";
    string tableEnd = "</table>";
    string tableRows = "";

    returnDel:A_ReturnsDeliveryItem[]? returnsList = returnsDeliveries.d?.results ?: [];

    record {|string? Material; [string?...] DeliveryDocument; [string?...] ActualDeliveryQuantity;|}[] groupedItems;
    if returnsList !is () {
        groupedItems =
        from var {Material, DeliveryDocument, ActualDeliveryQuantity} in returnsList
        group by Material
        select {Material, DeliveryDocument: [DeliveryDocument], ActualDeliveryQuantity: [ActualDeliveryQuantity]};
    } else {
        groupedItems = [];
    }

    from var Item in groupedItems
    do {
        tableRows += string `<tr><td>${Item.Material ?: ""}</td><td>${Item.DeliveryDocument.toString()}</td><td>${Item.ActualDeliveryQuantity.toString()}</td></tr>`;
    };

    return tableStart + tableRows + tableEnd;
}

public function getStartOfWeekTimestamp() returns string {
    time:Utc currentUtc = time:utcNow();
    time:Utc utc = time:utcAddSeconds(currentUtc, -7 * 24 * 60 * 60);
    return time:utcToString(utc).substring(0, 19);
}
