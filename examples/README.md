# Examples

The S/4 HANA Delivery and Transporation Ballerina connectors provide practical examples illustrating usage in various
scenarios. Explore
these [examples](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples), covering
use cases like integrating paper delivery note system with S/4HANA and generating weekly reports from S/4HANA system. 

1. [Weekly Report Generation](https://github.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/tree/main/examples/returns-from-sap) -
   Demonstrates leveraging the `sap.s4hana.api_customer_returns_delivery_srv_0002:Client` in Ballerina for S/4HANA API interactions. It
   specifically showcases how to retrieve customer returns delivery items and send an email containing a report on the returns delivery items
   in the S/4HANA SD module.

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