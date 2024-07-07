# Integrate Warehouse System with S/4HANA

This example demonstrates the use of `sap.s4hana.api_inbound_delivery_srv_0002:Client` for seamless API interactions with S/4HANA. It highlights how to process daily delivery information from XML files and confirm receipts in the S/4HANA inbound delivery system, illustrating efficient warehouse to S/4HANA integration.

## Prerequisites

### 1. Setup the S/4HANA API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials (
hostname, username, password).

### 2. Configuration

Configure S/4HANA API credentials in `Config.toml` in the example directory:

```toml
[s4hanaClientConfig]
hostname = "<Hostname>"
username = "<Username>"
password = "<Password>"
```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```
