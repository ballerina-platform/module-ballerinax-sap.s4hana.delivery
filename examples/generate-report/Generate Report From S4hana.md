# Weekly report generation on customer returns deliveries

This example showcases the use of `sap.s4hana.api_customer_returns_delivery_srv_0002:Client` for API interactions with S/4HANA. It focuses on retrieving data on customer returns delivery items and compiling this information into an email report, demonstrating an automated reporting process within the S/4HANA SD module.

## Prerequisites

### 1. Setup the S/4HANA API

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/sap/latest#setup-guide) for necessary credentials (
hostname, username, password).

### 2. Setup the Gmail Client

Refer to the [Setup Guide](https://central.ballerina.io/ballerinax/googleapis.gmail/latest#setup-guide) for necessary credentials (client ID, secret, tokens).

### 3. Configuration

Configure Salesforce and S/4HANA API credentials and Gmail credentials in `Config.toml` in the example directory:

```toml
[s4hanaClientConfig]
hostname = "<Hostname>"
username = "<Username>"
password = "<Password>"

[gmailClientConfig]
clientId = "<Client_ID>"
clientSecret = "<Client_Secret>"
refreshToken = "<Refresh_token>"
recipientAddress = "<Recipient_Address>"
fromAddress = "<Sender_Address>"
```

## Run the Example

Execute the following command to run the example:

```bash
bal run
```
