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
import ballerinax/sap.s4hana.api_inbound_delivery_srv_0002 as inbound;

configurable S4HANAClientConfig s4hanaClientConfig = ?;

final inbound:Client inboundClient = check new (
    config = {
        auth: {
            username: s4hanaClientConfig.username,
            password: s4hanaClientConfig.password
        }
    },
    hostname = s4hanaClientConfig.hostname
);

public function main() returns error? {

    xml readXml = check io:fileReadXml("resources/delivery.xml");
    InbDeliveries deliveries = check xmldata:fromXml(readXml);

    string daybeforeDate = time:utcToString(time:utcAddSeconds(time:utcNow(), - 24 * 60 * 60));

    inbound:UpdateA_InbDeliveryHeader deliveryentities = {ActualGoodsMovementDate: time:utcToString(time:utcNow())};
    inbound:Modified\ A_InbDeliveryHeaderType deliverypayload = {d: deliveryentities};

    inbound:CollectionOfA_InbDeliveryHeaderWrapper deliveriesHeader = check inboundClient->listA_InbDeliveryHeaders(\$filter = "DeliveryDate gt datetime'" + daybeforeDate + "' and ls datetime'" + time:utcToString(time:utcNow()));

    inbound:A_InbDeliveryHeader[] resultsList = deliveriesHeader.d?.results ?: [];

    foreach inbound:A_InbDeliveryHeader result in resultsList {
        foreach int i in 0 ... deliveries.delivery.length() - 1 {
            if (deliveries.delivery[i].DeliveryDate == time:utcToString(time:utcNow()).substring(0, 10)) {
                string deliveryDocument = deliveries.delivery[i].DeliveryDocument;
                if (deliveries.delivery[i].Supplier == result?.Supplier) {
                    http:Response|error patchAInbDeliveryHeader = inboundClient->patchA_InbDeliveryHeader(
                                deliveryDocument,
                                deliverypayload
                        );

                    foreach int j in 0 ... deliveries.delivery[i].DeliveryDocumentItem.Item.length() - 1 {
                        string deliveryItemId = deliveries.delivery[i].DeliveryDocumentItem.Item[j].ItemId ?: "";
                        string itemQuantity = deliveries.delivery[i].DeliveryDocumentItem.Item[j].Quantity ?: "";

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