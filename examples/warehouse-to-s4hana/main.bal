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

import ballerina/http;
import ballerina/io;
import ballerina/log;
import ballerina/time;
import ballerina/xmldata;
import ballerinax/sap.s4hana.api_inbound_delivery_srv_0002 as inbDel;

configurable S4HANAClientConfig s4hanaClientConfig = ?;

final inbDel:Client inboundClient = check new (
    config = {
        auth: {
            username: s4hanaClientConfig.username,
            password: s4hanaClientConfig.password
        }
    },
    hostname = s4hanaClientConfig.hostname
);

public function main() {
    InbDeliveries deliveries;
    do {
        xml readXml = check io:fileReadXml("resources/delivery.xml");
        deliveries = check xmldata:fromXml(readXml);
    } on fail error e {
        log:printError("Error occurred while reading the XML file", e);
        return;
    }

    inbDel:CollectionOfA_InbDeliveryHeaderWrapper|error res = inboundClient->listA_InbDeliveryHeaders(
        \$filter = getCurrentDayDeliveriesFilter()
        );
    if res is error {
        log:printError("Error occurred while fetching delivery headers", res);
        return;
    }

    inbDel:A_InbDeliveryHeader[] delHeaders = res.d?.results ?: [];
    map<inbDel:A_InbDeliveryHeader> delHeadersMap = map from inbDel:A_InbDeliveryHeader item in delHeaders
        select [item?.Supplier ?: "", item];

    string currentDate = time:utcToString(time:utcNow());
    Delivery[] actualDeliveries = deliveries.delivery;
    foreach Delivery delivery in actualDeliveries {
        inbDel:A_InbDeliveryHeader? availableDelHeader = delHeadersMap[delivery.supplier];
        if availableDelHeader == () {
            continue;
        }
        http:Response|error patchRes = inboundClient->patchA_InbDeliveryHeader(
                                delivery.deliveryDocument,
                                {d: {ActualGoodsMovementDate: currentDate}}
                        );
        if patchRes is error {
            log:printError(string `Error occurred while updating delivery header: ${delivery.deliveryDocument}`, patchRes);
            continue;
        }

        DeliveryItem[] deliveryItems = delivery.item;
        foreach DeliveryItem item in deliveryItems {
            http:Response|error response = inboundClient->patchA_InbDeliveryItem(
                                delivery.deliveryDocument,
                                item.id,
                                {d: {ActualDeliveryQuantity: item.quantity.toString()}}
                            );
            if response is error {
                log:printError(
                        string `Unable to patch delivery item: ${item.id} of document ${delivery.deliveryDocument}`,
                        response
                );
            }
        }
    }
}

function getCurrentDayDeliveriesFilter() returns string {
    time:Utc currentDate = time:utcNow();
    string daybeforeDate = time:utcToString(time:utcAddSeconds(currentDate, -24 * 60 * 60));
    return string `"DeliveryDate gt datetime'${daybeforeDate}' and ls datetime'${time:utcToString(currentDate)}"`;
}
