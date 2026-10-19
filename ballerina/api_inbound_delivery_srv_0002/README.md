## Overview

[SAP S/4HANA](https://www.sap.com/products/erp/s4hana.html) is a robust enterprise resource planning (ERP) solution,
designed for large-scale enterprises by SAP SE. It covers core business processes such as finance, procurement, sales,
and materials management, including delivery processing.

WSO2 SAP S/4HANA Inbound Delivery provides a way to interact with the [Inbound Delivery (A2X) API](https://api.sap.com/api/API_INBOUND_DELIVERY_SRV_0002/overview). The service allows to create, read, update and delete inbound deliveries with their items, partners, texts and document flow, to manage serial numbers, and to put away items and post or reverse the goods receipt.

### Key Features

- Create, read, update and delete inbound deliveries and their items
- Read delivery partners with their addresses, texts and document flow, and add or remove serial numbers
- Put away one or all items, split batches, and post or reverse the goods receipt

## Setup guide

This connector uses **Basic Authentication** with an SAP S/4HANA Cloud communication user. Each S/4HANA API is
exposed through a communication scenario, so the user must be assigned to a communication arrangement for the
**Delivery Processing Integration (`SAP_COM_0106`)** scenario before the connector can call it.

All the apps used below are in the **Communication Management** group of the SAP Fiori launchpad.

![Communication Management apps](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-1-display-scenarios.png)

### Step 1: Create a communication user

1. Sign in to your SAP S/4HANA Cloud system as an administrator.
2. Open the **Maintain Communication Users** app and choose **New**.
3. Enter a user name and a description, set a password, and choose **Create**.

Note the user name and password. These are the credentials the connector uses.

### Step 2: Create a communication system

1. Open the **Communication Systems** app and choose **New**.
2. Enter a system ID and a system name, and choose **Create**.

   ![Create a communication system](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/main/docs/setup/s4-1-communication-system.png)

3. Under **General** > **Technical Data**, enter a host name and a **Logical System** (an uppercase ID of up to
   10 characters, for example, `INTEGRATOR`). Some scenarios refuse to activate when the logical system is empty.
4. Under **Users for Inbound Communication**, add the communication user from Step 1 with the
   **User Name and Password** authentication method.

   ![Add the communication user for inbound communication](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/main/docs/setup/s4-2-communication-system-users.png)

5. Choose **Save**.

### Step 3: Create a communication arrangement

1. Open the **Communication Arrangements** app and choose **New**.
2. In the **Scenario** value help, search for **Delivery Processing Integration** and select **`SAP_COM_0106`**.
   This is the scenario that exposes `API_INBOUND_DELIVERY_SRV_0002`, the service this connector calls.

   ![Search for the communication scenario](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/main/docs/setup/s4-3-search-scenario-sap-com-0106.png)

3. Enter a unique name for the arrangement and choose **Create**.

   ![Name the communication arrangement](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/main/docs/setup/s4-4-new-arrangement-sap-com-0106.png)

4. Select the communication system from Step 2. The communication user from Step 1 is filled in as the inbound user.
   If the scenario lists outbound services that the integration does not need, clear their **Active** check boxes so
   that no outbound user is required.

   ![Communication arrangement details](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap.s4hana.delivery/main/docs/setup/s4-5-arrangement-details-sap-com-0106.png)

5. Choose **Save**.

### Step 4: Note the hostname

Open the saved arrangement. The **API-URL** next to **Own SAP Cloud System** shows the hostname
(`<unique id>-api.s4hana.cloud.sap`).

![View Hostname](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-sap/main/docs/setup/3-6-view-hostname.png)

You now have everything the connector needs:

- **hostname** - the API hostname, for example, `my123456-api.s4hana.cloud.sap`
- **username** - the communication user name
- **password** - the communication user password

## Quickstart

To use the `sap.s4hana.api_inbound_delivery_srv_0002` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `sap.s4hana.api_inbound_delivery_srv_0002` module.

```ballerina
import ballerinax/sap.s4hana.api_inbound_delivery_srv_0002 as inbDel;
```

### Step 2: Instantiate a new connector

Use the hostname and credentials to initiate a client.

```ballerina
configurable string hostname = ?;
configurable string username = ?;
configurable string password = ?;

inbDel:Client inbDelClient = check new (
    {
      auth: {
        username,
        password
      }
    },
    hostname
);
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

```ballerina
inbDel:CollectionOfA_InbDeliveryItemWrapper listInbDeliveryItems = check inbDelClient->listA_InbDeliveryItems();
```

### Step 4: Run the Ballerina application

```bash
bal run
```
