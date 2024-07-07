# Ballerina S/4HANA Delivery Connectors

[![Build](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/ballerina-platform/module-ballerinax-sap.s4hana.delivery/branch/main/graph/badge.svg)](https://codecov.io/gh/ballerina-platform/module-ballerinax-sap.s4hana.delivery)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-sap.s4hana.delivery.svg)](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/s4hana.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fs4hana)

[S/4HANA](https://www.sap.com/india/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE.

This repository encompasses all Ballerina packages pertaining to the S/4HANA delivery submodule. Notably:

1. The `ballerinax/sap.s4hana.api_outbound_delivery_srv_0002` package offers APIs for seamless integration with
   the [Outbound Delivery API v1.0.0](https://api.sap.com/api/API_OUTBOUND_DELIVERY_SRV_0002/overview). This service
   enables you to create, read, update and delete outbound deliveries.

2. The `ballerinax/sap.s4hana.api_inbound_delivery_srv_0002` package offers APIs for seamless integration with
   the  [Inbound Delivery API v2.2.0](https://api.sap.com/api/API_INBOUND_DELIVERY_SRV_0002/overview). This service
   enables users to create, read, update and delete inbound deliveries.

3. The `ballerinax/sap.s4hana.api_customer_returns_delivery_srv_0002` package offers APIs for seamless integration with
   the [Customer Returns Delivery API v2.1.0](https://api.sap.com/api/API_CUSTOMER_RETURNS_DELIVERY_SRV_0002/overview).
   This service enables users to read, create, update, and delete customer returns deliveries.

4. The `ballerinax/sap.s4hana.api_del_doc_with_credit_block` package offers APIs for seamless integration with
   the [Delivery Document with Credit Block API v1.0.0](https://api.sap.com/api/API_DEL_DOC_WITH_CREDIT_BLOCK/overview).
   The service contains entities for credit blocked delivery document and reject reason. Once the delivery document has
   been checked, released, or rejected, a success message containing the document number is sent in the response.

5. The `ballerinax/sap.s4hana.ce_managelocation_0001` package offers APIs for seamless integration with
   the [Location API v1.0.1](https://api.sap.com/api/CE_MANAGELOCATION_0001/overview).This service enables users to
   create, read, update, and delete locations through an API call.

6. The `ballerinax/sap.s4hana.api_cv_attachment_srv` package offers APIs for seamless integration with
   the [Freight Agreement Attachments API v1.0.0](https://api.sap.com/api/API_CV_ATTACHMENT_SRV/overview). This service
   allows you to manage attachments and attachment URLs for business objects.

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

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To build only one specific package

   ```bash
   ./gradlew clean :delivery-ballerina:<api_name>:build
   ```

   | API Name                               | Connector                                                    |
   |----------------------------------------|--------------------------------------------------------------|
   | api_outbound_delivery_srv_0002         | ballerinax/sap.s4hana.api_outbound_delivery_srv_0002         |
   | api_inbound_delivery_srv_0002          | ballerinax/sap.s4hana.api_inbound_delivery_srv_0002          |
   | api_customer_returns_delivery_srv_0002 | ballerinax/sap.s4hana.api_customer_returns_delivery_srv_0002 |
   | api_del_doc_with_credit_block          | ballerinax/sap.s4hana.api_del_doc_with_credit_block          |
   | ce_managelocation_0001                 | ballerinax/sap.s4hana.ce_managelocation_0001                 |
   | api_cv_attachment_srv                  | ballerinax/sap.s4hana.api_cv_attachment_srv                  |

5. To run tests against different environment:

   ```bash
   isTestOnLiveServer=true ./gradlew clean test 
   ```
   **Note**: `isTestOnLiveServer` is false by default, tests are run against mock server.

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
