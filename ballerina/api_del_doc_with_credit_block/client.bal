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

import ballerina/http;

# The service contains entities for credit blocked delivery document and reject reason. Once the delivery document has been checked, released, or rejected, a success message containing the document number is sent in the response. Once the credit blocked delivery document has been retrieved, the data is sent in the response. If there are any issues when reading, checking, releasing, or rejecting the credit blocked delivery document, the system displays error messages in the response.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }

    # Checks the credit status of a specific delivery document.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Success 
    remote isolated function createCheckCreditBlock(map<string|string[]> headers = {}, *CreateCheckCreditBlockQueries queries) returns ReturnMessage_1|error {
        string resourcePath = string `/CheckCreditBlock`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Rejects a specific credit blocked delivery document.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Success 
    remote isolated function createRejectCreditBlock(map<string|string[]> headers = {}, *CreateRejectCreditBlockQueries queries) returns ReturnMessage_2|error {
        string resourcePath = string `/RejectCreditBlock`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Releases a specific delivery document from the credit block.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Success 
    remote isolated function createReleaseCreditBlock(map<string|string[]> headers = {}, *CreateReleaseCreditBlockQueries queries) returns ReturnMessage_3|error {
        string resourcePath = string `/ReleaseCreditBlock`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Reads a specific credit blocked delivery document.
    #
    # + DeliveryDocument - Delivery
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_CreditBlockedDeliveryDoc(string DeliveryDocument, map<string|string[]> headers = {}, *GetA_CreditBlockedDeliveryDocQueries queries) returns A_CreditBlockedDeliveryDocWrapper|error {
        string resourcePath = string `/A_CreditBlockedDeliveryDoc('${getEncodedUri(DeliveryDocument)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads a specific rejection reason.
    #
    # + SalesDocumentRjcnReason - Reason for Rejection of Sales Documents
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entity 
    remote isolated function getA_SalesDocumentRjcnReason(string SalesDocumentRjcnReason, map<string|string[]> headers = {}, *GetA_SalesDocumentRjcnReasonQueries queries) returns A_SalesDocumentRjcnReasonWrapper|error {
        string resourcePath = string `/A_SalesDocumentRjcnReason('${getEncodedUri(SalesDocumentRjcnReason)}')`;
        map<Encoding> queryParamEncoding = {"$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads all credit blocked delivery documents.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_CreditBlockedDeliveryDocs(map<string|string[]> headers = {}, *ListA_CreditBlockedDeliveryDocsQueries queries) returns CollectionOfA_CreditBlockedDeliveryDocWrapper|error {
        string resourcePath = string `/A_CreditBlockedDeliveryDoc`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Reads all rejection reasons.
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Retrieved entities 
    remote isolated function listA_SalesDocumentRjcnReasons(map<string|string[]> headers = {}, *ListA_SalesDocumentRjcnReasonsQueries queries) returns CollectionOfA_SalesDocumentRjcnReasonWrapper|error {
        string resourcePath = string `/A_SalesDocumentRjcnReason`;
        map<Encoding> queryParamEncoding = {"$orderby": {style: FORM, explode: false}, "$select": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queries, queryParamEncoding);
        return self.clientEp->get(resourcePath, headers);
    }

    # Send a group of requests
    #
    # + headers - Headers to be sent with the request 
    # + request - Batch request 
    # + return - Batch response 
    remote isolated function performBatchOperation(http:Request request, map<string|string[]> headers = {}) returns http:Response|error {
        string resourcePath = string `/$batch`;
        // TODO: Update the request as needed;
        return self.clientEp->post(resourcePath, request, headers);
    }
}
