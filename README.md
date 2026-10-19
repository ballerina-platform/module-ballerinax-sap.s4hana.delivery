# Ballerina SAP S/4HANA Delivery Connectors

[![Build](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-sap.s4hana.delivery.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/s4hana.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fs4hana)

[SAP S/4HANA](https://www.sap.com/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE. It covers core business processes such as finance, procurement, sales,
and materials management, including delivery processing.

This repository encompasses all Ballerina packages pertaining to the SAP S/4HANA Delivery module. Notably:

1. [SAP S/4HANA Outbound Delivery](ballerina/api_outbound_delivery_srv_0002) provides a way to interact with the
   [Outbound Delivery (A2X) API](https://api.sap.com/api/API_OUTBOUND_DELIVERY_SRV_0002/overview).
   The service allows to create, read, update and delete outbound deliveries with their items, partners, addresses,
   texts and document flow, to manage handling units and serial numbers, and to pick items and post or reverse the
   goods issue.

2. [SAP S/4HANA Inbound Delivery](ballerina/api_inbound_delivery_srv_0002) provides a way to interact with the
   [Inbound Delivery (A2X) API](https://api.sap.com/api/API_INBOUND_DELIVERY_SRV_0002/overview).
   The service allows to create, read, update and delete inbound deliveries with their items, partners, texts and
   document flow, to manage serial numbers, and to put away items and post or reverse the goods receipt.

3. [SAP S/4HANA Customer Returns Delivery](ballerina/api_customer_returns_delivery_srv_0002) provides a way to interact with the
   [Customer Returns Delivery (A2X) API](https://api.sap.com/api/API_CUSTOMER_RETURNS_DELIVERY_SRV_0002/overview).
   The service allows to create, read, update and delete customer returns deliveries with their items, partners and
   document flow, and to put away items and post or reverse the goods receipt.

4. [SAP S/4HANA Delivery Document with Credit Block](ballerina/api_del_doc_with_credit_block) provides a way to interact with the
   [Delivery Document with Credit Block - Read, Check, Release, Reject (A2X) API](https://api.sap.com/api/API_DEL_DOC_WITH_CREDIT_BLOCK/overview).
   The service allows to read delivery documents that are blocked by credit management and the reasons for rejection,
   and to check, release or reject the credit block of a delivery document.

## Issues and projects

The **Issues** and **Projects** tabs are disabled for this repository as this is part of the Ballerina library. To
report bugs, request new features, start new discussions, view project boards, etc., visit the Ballerina
library [parent repository](https://github.com/ballerina-platform/ballerina-library).

This repository only contains the source code for the package.

## Build from the source

### Prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following
   sources:

   * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
   * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was
   installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

### Build options

Execute the commands below to build from the source.

1. To build all packages:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests in all packages:

   ```bash
   ./gradlew clean test
   ```

3. To build without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To build only one specific package:

   ```bash
   ./gradlew clean :delivery-ballerina:<module_name>:build
   ```

   | Module Name                            | Connector                                                    |
   |----------------------------------------|--------------------------------------------------------------|
   | api_outbound_delivery_srv_0002         | ballerinax/sap.s4hana.api_outbound_delivery_srv_0002         |
   | api_inbound_delivery_srv_0002          | ballerinax/sap.s4hana.api_inbound_delivery_srv_0002          |
   | api_customer_returns_delivery_srv_0002 | ballerinax/sap.s4hana.api_customer_returns_delivery_srv_0002 |
   | api_del_doc_with_credit_block          | ballerinax/sap.s4hana.api_del_doc_with_credit_block          |

5. To run tests against a live server, add a `tests/Config.toml` file to the package with the live server details
   and run the tests (`Config.toml` files are ignored by Git):

   ```toml
   isTestOnLiveServer = true
   hostname = "<unique id>-api.s4hana.cloud.sap"
   username = "<communication user>"
   password = "<password>"
   ```

   **Note**: Tests are run against the mock server by default.

6. To debug packages with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

7. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

8. Publish the generated artifacts to the local Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToLocalCentral=true
   ```

9. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`sap` package](https://lib.ballerina.io/ballerinax/sap/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
