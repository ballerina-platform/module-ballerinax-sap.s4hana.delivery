## Package Overview

[S/4HANA](https://www.sap.com/india/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE.

@description@

## Setup guide

1. Sign in to your S/4HANA dashboard.

2. Under the `Communication Management` section, click on the `Display Communications Scenario` title.

   ![Display Scenarios](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-1-display-scenarios.png)

3. In the search bar, type `@communication-scenario@` and select the corresponding scenario from the results.

   ![Search Sales Order](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-2-search-sales-order.png)

4. In the top right corner of the screen, click on `Create Communication Arrangement`.

   ![Click Create Arrangement](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-3-click-create-arrangement.png)

5. Enter a unique name for the arrangement.

   ![Give Arrangement Name](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-4-give-arrangement-name.png)

6. Choose an existing `Communication System` from the dropdown menu and save your arrangement.

   ![Select Existing Communication Arrangement](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-5-select-communication-system.png)

7. The hostname (`<unique id>-api.s4hana.cloud.sap`) will be displayed in the top right corner of the screen.

   ![View Hostname](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-6-view-hostname.png)

## Quickstart

To use the `@package-name@` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `@package-name@` module.

```ballerina
@import-statement@
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

@client-init@
    hostname = hostname,
    config = {
        auth: {
            username,
            password
        }
    }
);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

```ballerina
@api-invocation@
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The S/4 HANA Delivery Ballerina connectors offer practical examples that demonstrate their application in various
scenarios. Dive into
these [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples) to
discover how to integrate external systems with S/4HANA for tasks such as warehouse system integration and automated
report generation.

1. [Weekly Report Generation](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples/generate-report) -
   This example showcases the use of `sap.s4hana.api_customer_returns_delivery_srv_0002:Client` for API interactions
   with S/4HANA. It focuses on retrieving data on customer returns delivery items and compiling this information into an
   email report, demonstrating an automated reporting process within the S/4HANA SD module.

2. [Warehouse System Integration with S/4HANA](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples/warehouse-to-s4hana) -
   This example demonstrates the use of `sap.s4hana.api_inbound_delivery_srv_0002:Client` for seamless API interactions
   with S/4HANA. It highlights how to process daily delivery information from XML files and confirm receipts in the
   S/4HANA inbound delivery system, illustrating efficient warehouse to S/4HANA integration.

## Report Issues

To report bugs, request new features, start new discussions, view project boards, etc., go to
the [Ballerina library parent repository](https://github.com/ballerina-platform/ballerina-library).

## Useful Links

- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.