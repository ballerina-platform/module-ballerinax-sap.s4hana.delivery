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

public type LocationTextTPOfLocationOrderByOptions ("LocationUUID"|"LocationUUID desc"|"Language"|"Language desc"|"LocationDescription"|"LocationDescription desc"|"LocalLastChangeDateTime"|"LocalLastChangeDateTime desc"|"SAP__Messages"|"SAP__Messages desc")[];

# Represents the Queries record for the operation: listLocationTexts
public type ListLocationTextsQueries record {
    # Skip the first n items, see [Paging - Skip](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionskip)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptiontop)
    int \$top?;
    # Filter items by property values, see [Filtering](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionfilter)
    string \$filter?;
    # Order items by property values, see [Sorting](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionorderby)
    LocationTextOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationTextExpandOptions \$expand?;
    # Include count of items, see [Count](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptioncount)
    boolean \$count?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationTextSelectOptions \$select?;
};

public type LocationTPOfLocationAddressSelectOptions ("LocationUUID"|"Location"|"LocationType"|"LocationAdditionalUUID"|"LocationTimeZone"|"GlobalLocationNumber"|"LocationDUNSNumber"|"LocationUNCode"|"LocationIATACode"|"GeoCoordinatesLongitudeValue"|"GeoCoordinatesLatitudeValue"|"GeoCoordsValidityEndDateTime"|"GeoCoordsAreManuallyChanged"|"CreationDateTime"|"CreatedByUser"|"ChangedDateTime"|"LocalLastChangeDateTime"|"LastChangedByUser"|"LocationIsTemporary"|"IsBusinessPurposeCompleted"|"AddressID"|"SAP__Messages")[];

# Represents the Queries record for the operation: getLocationAddressTPOfLocation
public type GetLocationAddressTPOfLocationQueries record {
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationAddressTPOfLocationExpandOptions \$expand?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationAddressTPOfLocationSelectOptions \$select?;
};

public type LocationTextSelectOptions ("LocationUUID"|"Language"|"LocationDescription"|"LocalLastChangeDateTime"|"SAP__Messages")[];

# Represents the Queries record for the operation: listLocations
public type ListLocationsQueries record {
    # Skip the first n items, see [Paging - Skip](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionskip)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptiontop)
    int \$top?;
    # Filter items by property values, see [Filtering](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionfilter)
    string \$filter?;
    # Order items by property values, see [Sorting](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionorderby)
    LocationOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationExpandOptions \$expand?;
    # Include count of items, see [Count](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptioncount)
    boolean \$count?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationSelectOptions \$select?;
};

public type CreateSAP__Message record {
    string code?;
    string message?;
    string? target?;
    string[] additionalTargets?;
    boolean transition?;
    int numericSeverity?;
    string? longtextUrl?;
};

public type CollectionOfLocationText record {
    count \@odata\.count?;
    LocationText[] value?;
};

public type UpdateLocation record {
    @constraint:String {maxLength: 6}
    string LocationTimeZone?;
    # Global Location Number
    @constraint:String {maxLength: 13}
    string GlobalLocationNumber?;
    @constraint:String {maxLength: 13}
    string LocationDUNSNumber?;
    # United Nations Code for Trade and Transport Locations
    @constraint:String {maxLength: 5}
    string LocationUNCode?;
    # International Air Transport Association Location Identifier
    @constraint:String {maxLength: 3}
    string LocationIATACode?;
    # Longitude Specified in GPS Coordinates
    decimal|string GeoCoordinatesLongitudeValue?;
    # Latitude Specified in GPS Coordinates
    decimal|string GeoCoordinatesLatitudeValue?;
    # UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
    string? GeoCoordsValidityEndDateTime?;
    # Manually Changed Geocoordinates
    boolean GeoCoordsAreManuallyChanged?;
    UpdateSAP__Message[] SAP__Messages?;
};

# Represents the Queries record for the operation: getLocationText
public type GetLocationTextQueries record {
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationTextExpandOptions \$expand?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationTextSelectOptions \$select?;
};

# Represents the Queries record for the operation: getLocation
public type GetLocationQueries record {
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationExpandOptions \$expand?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationSelectOptions \$select?;
};

public type LocationTPOfLocationTextSelectOptions ("LocationUUID"|"Location"|"LocationType"|"LocationAdditionalUUID"|"LocationTimeZone"|"GlobalLocationNumber"|"LocationDUNSNumber"|"LocationUNCode"|"LocationIATACode"|"GeoCoordinatesLongitudeValue"|"GeoCoordinatesLatitudeValue"|"GeoCoordsValidityEndDateTime"|"GeoCoordsAreManuallyChanged"|"CreationDateTime"|"CreatedByUser"|"ChangedDateTime"|"LocalLastChangeDateTime"|"LastChangedByUser"|"LocationIsTemporary"|"IsBusinessPurposeCompleted"|"AddressID"|"SAP__Messages")[];

public type LocationAddress record {
    # Internal Location Number (Customer, Supplier, or Plant)
    string LocationUUID?;
    @constraint:String {maxLength: 10}
    string AddressPersonID?;
    # Version ID for International Addresses
    @constraint:String {maxLength: 1}
    string AddressRepresentationCode?;
    @constraint:String {maxLength: 10}
    string AddressID?;
    # Address Time Zone
    @constraint:String {maxLength: 6}
    string AddressTimeZone?;
    @constraint:String {maxLength: 40}
    string CityName?;
    # City Postal Code
    @constraint:String {maxLength: 10}
    string PostalCode?;
    @constraint:String {maxLength: 60}
    string StreetName?;
    @constraint:String {maxLength: 10}
    string HouseNumber?;
    @constraint:String {maxLength: 3}
    string Country?;
    # Region (State, Province, County)
    @constraint:String {maxLength: 3}
    string Region?;
    @constraint:String {maxLength: 20}
    string SearchTerm1?;
    @constraint:String {maxLength: 20}
    string SearchTerm2?;
    SAP__Message[] SAP__Messages?;
    Location _LocationTP?;
};

public type LocationAddressTPOfLocationSelectOptions ("LocationUUID"|"AddressPersonID"|"AddressRepresentationCode"|"AddressID"|"AddressTimeZone"|"CityName"|"PostalCode"|"StreetName"|"HouseNumber"|"Country"|"Region"|"SearchTerm1"|"SearchTerm2"|"SAP__Messages")[];

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://{host}:{port}";
|};

public type CollectionOfLocationAddress record {
    count \@odata\.count?;
    LocationAddress[] value?;
};

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig|http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

public type LocationExpandOptions ("*"|"_LocationAddressTP"|"_LocationTextTP")[];

public type LocationTextTPOfLocationSelectOptions ("LocationUUID"|"Language"|"LocationDescription"|"LocalLastChangeDateTime"|"SAP__Messages")[];

public type CreateLocation record {
    # Internal Location Number (Customer, Supplier, or Plant)
    string LocationUUID;
    @constraint:String {maxLength: 20}
    string Location?;
    @constraint:String {maxLength: 4}
    string LocationType?;
    string? LocationAdditionalUUID?;
    @constraint:String {maxLength: 6}
    string LocationTimeZone?;
    # Global Location Number
    @constraint:String {maxLength: 13}
    string GlobalLocationNumber?;
    @constraint:String {maxLength: 13}
    string LocationDUNSNumber?;
    # United Nations Code for Trade and Transport Locations
    @constraint:String {maxLength: 5}
    string LocationUNCode?;
    # International Air Transport Association Location Identifier
    @constraint:String {maxLength: 3}
    string LocationIATACode?;
    # Longitude Specified in GPS Coordinates
    decimal|string GeoCoordinatesLongitudeValue?;
    # Latitude Specified in GPS Coordinates
    decimal|string GeoCoordinatesLatitudeValue?;
    # UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
    string? GeoCoordsValidityEndDateTime?;
    # Manually Changed Geocoordinates
    boolean GeoCoordsAreManuallyChanged?;
    @constraint:String {maxLength: 10}
    string AddressID?;
    CreateSAP__Message[] SAP__Messages?;
    CreateLocationAddress? _LocationAddressTP?;
    CreateLocationText[] _LocationTextTP?;
};

public type LocationTPOfLocationTextExpandOptions ("*"|"_LocationAddressTP"|"_LocationTextTP")[];

public type CreateLocationAddress record {
    @constraint:String {maxLength: 10}
    string AddressPersonID;
    # Version ID for International Addresses
    @constraint:String {maxLength: 1}
    string AddressRepresentationCode;
    @constraint:String {maxLength: 10}
    string AddressID?;
    # Address Time Zone
    @constraint:String {maxLength: 6}
    string AddressTimeZone?;
    @constraint:String {maxLength: 40}
    string CityName?;
    # City Postal Code
    @constraint:String {maxLength: 10}
    string PostalCode?;
    @constraint:String {maxLength: 60}
    string StreetName?;
    @constraint:String {maxLength: 10}
    string HouseNumber?;
    @constraint:String {maxLength: 3}
    string Country?;
    # Region (State, Province, County)
    @constraint:String {maxLength: 3}
    string Region?;
    @constraint:String {maxLength: 20}
    string SearchTerm1?;
    @constraint:String {maxLength: 20}
    string SearchTerm2?;
    CreateSAP__Message[] SAP__Messages?;
    CreateLocation _LocationTP?;
};

# The number of entities in the collection. Available when using the [$count](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptioncount) query option.
public type count decimal|string;

public type LocationOrderByOptions ("LocationUUID"|"LocationUUID desc"|"Location"|"Location desc"|"LocationType"|"LocationType desc"|"LocationAdditionalUUID"|"LocationAdditionalUUID desc"|"LocationTimeZone"|"LocationTimeZone desc"|"GlobalLocationNumber"|"GlobalLocationNumber desc"|"LocationDUNSNumber"|"LocationDUNSNumber desc"|"LocationUNCode"|"LocationUNCode desc"|"LocationIATACode"|"LocationIATACode desc"|"GeoCoordinatesLongitudeValue"|"GeoCoordinatesLongitudeValue desc"|"GeoCoordinatesLatitudeValue"|"GeoCoordinatesLatitudeValue desc"|"GeoCoordsValidityEndDateTime"|"GeoCoordsValidityEndDateTime desc"|"GeoCoordsAreManuallyChanged"|"GeoCoordsAreManuallyChanged desc"|"CreationDateTime"|"CreationDateTime desc"|"CreatedByUser"|"CreatedByUser desc"|"ChangedDateTime"|"ChangedDateTime desc"|"LocalLastChangeDateTime"|"LocalLastChangeDateTime desc"|"LastChangedByUser"|"LastChangedByUser desc"|"LocationIsTemporary"|"LocationIsTemporary desc"|"IsBusinessPurposeCompleted"|"IsBusinessPurposeCompleted desc"|"AddressID"|"AddressID desc"|"SAP__Messages"|"SAP__Messages desc")[];

public type UpdateLocationText record {
    # Location Description
    @constraint:String {maxLength: 40}
    string LocationDescription?;
    UpdateSAP__Message[] SAP__Messages?;
};

public type LocationTextOrderByOptions ("LocationUUID"|"LocationUUID desc"|"Language"|"Language desc"|"LocationDescription"|"LocationDescription desc"|"LocalLastChangeDateTime"|"LocalLastChangeDateTime desc"|"SAP__Messages"|"SAP__Messages desc")[];

public type UpdateSAP__Message record {
    string code?;
    string message?;
    string? target?;
    string[] additionalTargets?;
    boolean transition?;
    int numericSeverity?;
    string? longtextUrl?;
};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

public type LocationAddressExpandOptions ("*"|"_LocationTP")[];

public type LocationSelectOptions ("LocationUUID"|"Location"|"LocationType"|"LocationAdditionalUUID"|"LocationTimeZone"|"GlobalLocationNumber"|"LocationDUNSNumber"|"LocationUNCode"|"LocationIATACode"|"GeoCoordinatesLongitudeValue"|"GeoCoordinatesLatitudeValue"|"GeoCoordsValidityEndDateTime"|"GeoCoordsAreManuallyChanged"|"CreationDateTime"|"CreatedByUser"|"ChangedDateTime"|"LocalLastChangeDateTime"|"LastChangedByUser"|"LocationIsTemporary"|"IsBusinessPurposeCompleted"|"AddressID"|"SAP__Messages")[];

public type UpdateLocationAddress record {
    # Address Time Zone
    @constraint:String {maxLength: 6}
    string AddressTimeZone?;
    @constraint:String {maxLength: 40}
    string CityName?;
    # City Postal Code
    @constraint:String {maxLength: 10}
    string PostalCode?;
    @constraint:String {maxLength: 60}
    string StreetName?;
    @constraint:String {maxLength: 10}
    string HouseNumber?;
    @constraint:String {maxLength: 3}
    string Country?;
    # Region (State, Province, County)
    @constraint:String {maxLength: 3}
    string Region?;
    @constraint:String {maxLength: 20}
    string SearchTerm1?;
    @constraint:String {maxLength: 20}
    string SearchTerm2?;
    UpdateSAP__Message[] SAP__Messages?;
};

# Represents the Queries record for the operation: getLocationAddress
public type GetLocationAddressQueries record {
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationAddressExpandOptions \$expand?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationAddressSelectOptions \$select?;
};

public type LocationAddressTPOfLocationExpandOptions ("*"|"_LocationTP")[];

# Represents the Queries record for the operation: listLocationTextTPsOfLocation
public type ListLocationTextTPsOfLocationQueries record {
    # Skip the first n items, see [Paging - Skip](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionskip)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptiontop)
    int \$top?;
    # Filter items by property values, see [Filtering](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionfilter)
    string \$filter?;
    # Order items by property values, see [Sorting](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionorderby)
    LocationTextTPOfLocationOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationTextTPOfLocationExpandOptions \$expand?;
    # Include count of items, see [Count](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptioncount)
    boolean \$count?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationTextTPOfLocationSelectOptions \$select?;
};

public type SAP__Message record {
    string code?;
    string message?;
    string? target?;
    string[] additionalTargets?;
    boolean transition?;
    int numericSeverity?;
    string? longtextUrl?;
};

public type LocationAddressOrderByOptions ("LocationUUID"|"LocationUUID desc"|"AddressPersonID"|"AddressPersonID desc"|"AddressRepresentationCode"|"AddressRepresentationCode desc"|"AddressID"|"AddressID desc"|"AddressTimeZone"|"AddressTimeZone desc"|"CityName"|"CityName desc"|"PostalCode"|"PostalCode desc"|"StreetName"|"StreetName desc"|"HouseNumber"|"HouseNumber desc"|"Country"|"Country desc"|"Region"|"Region desc"|"SearchTerm1"|"SearchTerm1 desc"|"SearchTerm2"|"SearchTerm2 desc"|"SAP__Messages"|"SAP__Messages desc")[];

public type LocationTextTPOfLocationExpandOptions ("*"|"_LocationTP")[];

public type LocationText record {
    # Internal Location Number (Customer, Supplier, or Plant)
    string LocationUUID?;
    @constraint:String {maxLength: 2}
    string Language?;
    # Location Description
    @constraint:String {maxLength: 40}
    string LocationDescription?;
    # UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
    string? LocalLastChangeDateTime?;
    SAP__Message[] SAP__Messages?;
    Location _LocationTP?;
};

public type LocationTPOfLocationAddressExpandOptions ("*"|"_LocationAddressTP"|"_LocationTextTP")[];

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

public type LocationTextExpandOptions ("*"|"_LocationTP")[];

# Represents the Queries record for the operation: listLocationAddresses
public type ListLocationAddressesQueries record {
    # Skip the first n items, see [Paging - Skip](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionskip)
    int \$skip?;
    # Show only the first n items, see [Paging - Top](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptiontop)
    int \$top?;
    # Filter items by property values, see [Filtering](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionfilter)
    string \$filter?;
    # Order items by property values, see [Sorting](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionorderby)
    LocationAddressOrderByOptions \$orderby?;
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationAddressExpandOptions \$expand?;
    # Include count of items, see [Count](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptioncount)
    boolean \$count?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationAddressSelectOptions \$select?;
};

# Represents the Queries record for the operation: getLocationTPOfLocationText
public type GetLocationTPOfLocationTextQueries record {
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationTPOfLocationTextExpandOptions \$expand?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationTPOfLocationTextSelectOptions \$select?;
};

public type LocationAddressSelectOptions ("LocationUUID"|"AddressPersonID"|"AddressRepresentationCode"|"AddressID"|"AddressTimeZone"|"CityName"|"PostalCode"|"StreetName"|"HouseNumber"|"Country"|"Region"|"SearchTerm1"|"SearchTerm2"|"SAP__Messages")[];

# Represents the Queries record for the operation: getLocationTPOfLocationAddress
public type GetLocationTPOfLocationAddressQueries record {
    # Expand related entities, see [Expand](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionexpand)
    LocationTPOfLocationAddressExpandOptions \$expand?;
    # Select properties to be returned, see [Select](http://docs.oasis-open.org/odata/odata/v4.01/odata-v4.01-part1-protocol.html#sec_SystemQueryOptionselect)
    LocationTPOfLocationAddressSelectOptions \$select?;
};

public type CreateLocationText record {
    @constraint:String {maxLength: 2}
    string Language;
    # Location Description
    @constraint:String {maxLength: 40}
    string LocationDescription?;
    CreateSAP__Message[] SAP__Messages?;
    CreateLocation _LocationTP?;
};

public type CollectionOfLocation record {
    count \@odata\.count?;
    Location[] value?;
};

public type Location record {
    # Internal Location Number (Customer, Supplier, or Plant)
    string LocationUUID?;
    @constraint:String {maxLength: 20}
    string Location?;
    @constraint:String {maxLength: 4}
    string LocationType?;
    string? LocationAdditionalUUID?;
    @constraint:String {maxLength: 6}
    string LocationTimeZone?;
    # Global Location Number
    @constraint:String {maxLength: 13}
    string GlobalLocationNumber?;
    @constraint:String {maxLength: 13}
    string LocationDUNSNumber?;
    # United Nations Code for Trade and Transport Locations
    @constraint:String {maxLength: 5}
    string LocationUNCode?;
    # International Air Transport Association Location Identifier
    @constraint:String {maxLength: 3}
    string LocationIATACode?;
    # Longitude Specified in GPS Coordinates
    decimal|string GeoCoordinatesLongitudeValue?;
    # Latitude Specified in GPS Coordinates
    decimal|string GeoCoordinatesLatitudeValue?;
    # UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
    string? GeoCoordsValidityEndDateTime?;
    # Manually Changed Geocoordinates
    boolean GeoCoordsAreManuallyChanged?;
    # UTC time stamp in long form (YYYYMMDDhhmmss,mmmuuun)
    string? CreationDateTime?;
    # Name of Person Who Created the Object
    @constraint:String {maxLength: 12}
    string CreatedByUser?;
    # UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
    string? ChangedDateTime?;
    # UTC Time Stamp in Short Form (YYYYMMDDhhmmss)
    string? LocalLastChangeDateTime?;
    # Name of Person Who Changed Object
    @constraint:String {maxLength: 12}
    string LastChangedByUser?;
    boolean LocationIsTemporary?;
    # Business Purpose Completed Flag
    @constraint:String {maxLength: 1}
    string IsBusinessPurposeCompleted?;
    @constraint:String {maxLength: 10}
    string AddressID?;
    SAP__Message[] SAP__Messages?;
    LocationAddress? _LocationAddressTP?;
    LocationText[] _LocationTextTP?;
};
