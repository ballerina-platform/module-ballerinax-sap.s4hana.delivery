# Extract delivery information from XML files and confirm receipt in S/4HANA inbound delivery

This example illustrates leveraging the `sap.s4hana.api_inbound_delivery_srv_0002:Client` in Ballerina for S/4HANA API interactions. It specifically showcases how to extract everyday delivery information from XML files and confirm the receipt in the S/4HANA inbound delivery.

## Prerequisites

### 1. Setup the S/4HANA API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials (
hostname, username, password).

### 2. Include XML files inside the package path that follow the format below

```xml
<?xml version="1.1" encoding="UTF-8"?>
<inbound_deliveries>
    <delivery>
        <DeliveryDocument>DOC001</DeliveryDocument>
        <DeliveryDocumentItem>
            <Item>
                <ItemId>I001</ItemId>
                <Quantity>20</Quantity>
            </Item>
            <Item>
                <ItemId>I002</ItemId>
                <Quantity>20</Quantity>
            </Item>
        </DeliveryDocumentItem>
        <Supplier>Supplier A</Supplier>
        <DeliveryDate>2024-07-10</DeliveryDate>
    </delivery> 
</inbound_deliveries>

### 3. Configuration

Configure S/4HANA API credentials in `Config.toml` in the example directory:

```toml
[s4hanaClientConfig]
hostname = "<Hostname>"
username = "<Username>"
password = "<Password>"

## Run the Example

Execute the following command to run the example:

```bash
bal run
```