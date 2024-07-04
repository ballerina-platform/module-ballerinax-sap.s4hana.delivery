# Send a reminder on approval of pending orders

This example demonstrates leveraging the `sap.s4hana.api_customer_returns_delivery_srv_0002:Client` in Ballerina for S/4HANA API interactions. It
specifically showcases how to retrieve customer returns delivery items and send an email containing a report on the returns delivery items
in the S/4HANA SD module.
## Prerequisites

### 1. Setup the S/4HANA API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials (
hostname, username, password).

### 2. Setup the Salesforce Client

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/salesforce/latest#setup-guide) for necessary
credentials (client ID, secret, tokens).

### 3. Setup the Salesforce Listener

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/trigger.salesforce/0.10.0#prerequisites) for
necessary credentials (username, password, secret).

### 3. Configuration

Configure Salesforce and S/4HANA API credentials in `Config.toml` in the example directory:

```toml
[s4hanaClientConfig]
hostname = "<Hostname>"
username = "<Username>"
password = "<Password>"

[gmailClientConfig]
clientId = "<Client_ID>"
clientSecret = "<Client_Secret>"
refreshToken = "<Refresh_token>"

[gmailConfig]
recipientAddress = "<Recipient_Address>"
senderAddress = "<Sender_Address>"
environment = "DEVELOPER"

```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```