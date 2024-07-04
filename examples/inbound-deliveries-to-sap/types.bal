type S4HANAClientConfig record {|
    string hostname;
    string username;
    string password;
|};

type inbound_deliveries record {
    Delivery[] delivery;
};

type Delivery record {
    string DeliveryDocument;
    string Supplier;
    string DeliveryDate;
    DeliveryDocumentItem DeliveryDocumentItem;
};

type DeliveryDocumentItem record{
    Item[] Item;
};

type Item record{
    string ItemId?;
    string Quantity?;
};