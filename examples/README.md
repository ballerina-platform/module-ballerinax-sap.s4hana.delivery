# Examples

The S/4 HANA Delivery Ballerina connectors offer practical examples that demonstrate their application in various scenarios. Dive into these [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples) to discover how to integrate external systems with S/4HANA for tasks such as warehouse system integration and automated report generation.

1. [Weekly Report Generation](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples/generate-report) - 
   This example showcases the use of `sap.s4hana.api_customer_returns_delivery_srv_0002:Client` for API interactions with S/4HANA. It focuses on retrieving data on customer returns delivery items and compiling this information into an email report, demonstrating an automated reporting process within the S/4HANA SD module.

2. [Warehouse System Integration with S/4HANA](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples/inbound-deliveries-to-sap) - 
    This example demonstrates the use of `sap.s4hana.api_inbound_delivery_srv_0002:Client` for seamless API interactions with S/4HANA. It highlights how to process daily delivery information from XML files and confirm receipts in the S/4HANA inbound delivery system, illustrating efficient warehouse to S/4HANA integration.

## Prerequisites

Each example includes detailed steps.

## Running an Example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the Examples with the Local Module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the
module is manually written to the central repository as a workaround. Consequently, the bash script may modify your
local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```