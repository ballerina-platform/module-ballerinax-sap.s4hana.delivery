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
import ballerina/time;
import ballerina/xmldata;
import ballerinax/s4hana.api_inbound_delivery_srv_0002 as inbound;

configurable S4HANAClientConfig s4hanaClientConfig = ?;

final inbound:Client inboundClient = check new (
    config = {
        auth: {
            username: s4hanaconfig.username,
            password: s4hanaconfig.password
        }
    },
    hostname = s4hanaconfig.hostname
);

public function main() returns error? {

    xml readXml = check io:fileReadXml("files/document.xml");
    inbound_deliveries filereading = check xmldata:fromXml(readXml);

    string currentDate = time:utcToString(time:utcNow());
    string dayafterDate = time:utcToString(time:utcAddSeconds(time:utcNow(), 24 * 60 * 60));

    inbound:UpdateA_InbDeliveryHeader deliveryentities = {ActualGoodsMovementDate: currentDate};
    inbound:Modified\ A_InbDeliveryHeaderType deliverypayload = {d: deliveryentities};

    string filterQuery = "DeliveryDate gt datetime'" + currentDate + "' and ls datetime'" + dayafterDate;

    inbound:CollectionOfA_InbDeliveryHeaderWrapper deliveries = check inboundClient->listA_InbDeliveryHeaders(\$filter = filterQuery);

    inbound:A_InbDeliveryHeader[] resultsList = deliveries.d?.results ?: [];

    foreach inbound:A_InbDeliveryHeader result in resultsList {
        foreach int i in 0 ... filereading.delivery.length() - 1 {
            if (filereading.delivery[i].DeliveryDate == currentDate.substring(0, 10)) {
                string deliveryDocument = filereading.delivery[i].DeliveryDocument;
                if (filereading.delivery[i].Supplier == result?.Supplier) {
                    http:Response|error patchAInbDeliveryHeader = inboundClient->patchA_InbDeliveryHeader(
                                deliveryDocument,
                                deliverypayload
                        );

                    foreach int j in 0 ... filereading.delivery[i].DeliveryDocumentItem.Item.length() - 1 {
                        string deliveryItemId = filereading.delivery[i].DeliveryDocumentItem.Item[j].ItemId ?: "";
                        string itemQuantity = filereading.delivery[i].DeliveryDocumentItem.Item[j].Quantity ?: "";

                        inbound:UpdateA_InbDeliveryItem itemEntities = {ActualDeliveryQuantity: itemQuantity};
                        inbound:Modified\ A_InbDeliveryItemType itempayload = {d: itemEntities};

                        http:Response|error patchAInbDeliveryItem = inboundClient->patchA_InbDeliveryItem(
                                deliveryDocument,
                                deliveryItemId,
                                itempayload
                            );
                    }
                }
            }
        }
    }

}