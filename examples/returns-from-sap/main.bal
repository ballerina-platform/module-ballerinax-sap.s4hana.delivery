import ballerina/io;
import ballerina/time;
import ballerinax/googleapis.gmail as gmail;
import osa/api_customer_returns_delivery_srv_0002 as returnDel;

configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

configurable string refreshToken = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

configurable string recipientAddress = ?;
configurable string fromAddress = ?;

returnDel:ConnectionConfig config = {
    auth: {
        username: username,
        password: password
    }
};

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
    io:println("Client is created successfully");
    string query = "CreationDate gt datetime'" + getUTC() + "'";

    returnDel:CollectionOfA_ReturnsDeliveryItemWrapper returnsDeliveries = check returnDelClient->listA_ReturnsDeliveryItems(
        \$filter = query
    );
    
    string report = generateReport(returnsDeliveries);

    gmail:MessageRequest message = {
        to: [recipientAddress],
        'from: fromAddress,
        subject: "Customer Returns Delivery Report",
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

    foreach var Item in groupedItems {
        string material = Item.Material ?: "";
        string deliveryDocStr = Item.DeliveryDocument.toString();
        string totalQuantity = Item.ActualDeliveryQuantity.toString();

        tableRows += "<tr><td>" + material + "</td>";
        tableRows += "<td>" + deliveryDocStr + "</td>";
        tableRows += "<td>" + totalQuantity.toString() + "</td></tr>";
    }
    return tableStart + tableRows + tableEnd;
}

public function getUTC() returns string {
    time:Utc currentUtc = time:utcNow();
    time:Utc utc = time:utcAddSeconds(currentUtc, -7 * 24 * 60 * 60);
    return time:utcToString(utc).substring(0, 19);
}
