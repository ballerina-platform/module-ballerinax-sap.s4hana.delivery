// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

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

import ballerina/constraint;
import ballerina/http;

public type A_CreditBlockedDeliveryDocOrderByOptions ("DeliveryDocument"|"DeliveryDocument desc"|"SDDocumentCategory"|"SDDocumentCategory desc"|"SalesOrganization"|"SalesOrganization desc"|"SalesOffice"|"SalesOffice desc"|"ShippingPoint"|"ShippingPoint desc"|"CreationDate"|"CreationDate desc"|"CreatedByUser"|"CreatedByUser desc"|"LastChangedByUser"|"LastChangedByUser desc"|"LastChangeDate"|"LastChangeDate desc"|"SoldToParty"|"SoldToParty desc"|"CustomerCreditAccount"|"CustomerCreditAccount desc"|"ControllingAreaCurrency"|"ControllingAreaCurrency desc"|"ReleasedCreditAmount"|"ReleasedCreditAmount desc"|"CreditBlockReleaseDate"|"CreditBlockReleaseDate desc"|"NextShippingDate"|"NextShippingDate desc"|"CentralCreditChkTechErrSts"|"CentralCreditChkTechErrSts desc"|"OverallSDProcessStatus"|"OverallSDProcessStatus desc"|"OverallGoodsMovementStatus"|"OverallGoodsMovementStatus desc"|"TotalCreditCheckStatus"|"TotalCreditCheckStatus desc"|"FinDocCreditCheckStatus"|"FinDocCreditCheckStatus desc"|"CentralCreditCheckStatus"|"CentralCreditCheckStatus desc")[];

public type ReturnMessage_1 record {
    ReturnMessage_1_d d?;
};

public type OkReturnMessage_1 record {|
    *http:Ok;
    ReturnMessage_1 body;
    map<string|string[]> headers;
|};

public type CollectionOfA_CreditBlockedDeliveryDoc record {
    count __count?;
    A_CreditBlockedDeliveryDoc[] results?;
};

public type A_CreditBlockedDeliveryDocSelectOptions ("DeliveryDocument"|"SDDocumentCategory"|"SalesOrganization"|"SalesOffice"|"ShippingPoint"|"CreationDate"|"CreatedByUser"|"LastChangedByUser"|"LastChangeDate"|"SoldToParty"|"CustomerCreditAccount"|"ControllingAreaCurrency"|"ReleasedCreditAmount"|"CreditBlockReleaseDate"|"NextShippingDate"|"CentralCreditChkTechErrSts"|"OverallSDProcessStatus"|"OverallGoodsMovementStatus"|"TotalCreditCheckStatus"|"FinDocCreditCheckStatus"|"CentralCreditCheckStatus")[];

# The number of entities in the collection. Available when using the [$inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67) query option.
public type count string;

public type ReturnMessage record {
    string MessageType?;
    string Message?;
};

public type CollectionOfA_CreditBlockedDeliveryDocWrapper record {
    CollectionOfA_CreditBlockedDeliveryDoc d?;
};

public type A_CreditBlockedDeliveryDoc record {
    @constraint:String {maxLength: 10}
    string DeliveryDocument?;
    string? SDDocumentCategory?;
    string? SalesOrganization?;
    string? SalesOffice?;
    # Shipping Point / Receiving Point
    string? ShippingPoint?;
    # Record Creation Date
    string? CreationDate?;
    # Name of Person Responsible for Creating the Object
    string? CreatedByUser?;
    # Name of Person Who Changed Object
    string? LastChangedByUser?;
    # Last Changed On
    string? LastChangeDate?;
    string? SoldToParty?;
    # Customer's Account Number with Credit Limit Reference
    string? CustomerCreditAccount?;
    # Currency key of credit control area
    string? ControllingAreaCurrency?;
    # Released Credit Value of the Document
    string? ReleasedCreditAmount?;
    # Release date of the document determined by credit management
    string? CreditBlockReleaseDate?;
    string? NextShippingDate?;
    # Status of Technical Error SAP Credit Management
    string? CentralCreditChkTechErrSts?;
    # Overall Processing Status (Header/All Items)
    string? OverallSDProcessStatus?;
    # Goods Movement Status (All Items)
    string? OverallGoodsMovementStatus?;
    # Overall Status of Credit Checks
    string? TotalCreditCheckStatus?;
    # Status of Credit Check Against Financial Document
    string? FinDocCreditCheckStatus?;
    # Status of Credit Check SAP Credit Management
    string? CentralCreditCheckStatus?;
};

public type ReturnMessage_1_d record {
    ReturnMessage CheckCreditBlock?;
};
