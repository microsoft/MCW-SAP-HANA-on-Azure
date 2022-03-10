![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
SAP HANA on Azure
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
</div>

<div class="MCWHeader3">
November 2021
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2021 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

# Please note:  This lab has been archived and is no longer being updated or maintained.

**Contents**

<!-- TOC -->

- [SAP HANA on Azure before the hands-on lab setup guide](#sap-hana-on-azure-before-the-hands-on-lab-setup-guide)
    - [Requirements](#requirements)
    - [Before the hands-on lab](#before-the-hands-on-lab)
        - [Task 1: Validate the owner role assignment in the Azure subscription](#task-1-Validate-the-owner-role-assignment-in-the-Azure-subscription)
        - [Task 2: Validate the availability of the SUSE Linux Enterprise Server image](#task-2-validate-the-availability-of-the-suse-linux-enterprise-server-image)
        - [Task 3: Validate a sufficient number of vCPU cores](#task-3-validate-a-sufficient-number-of-vcpu-cores)

<!-- /TOC -->

# SAP HANA on Azure before the hands-on lab setup guide

## Requirements

-   A Microsoft Azure subscription

-   A work or school account with the Owner role in the Azure subscription

-   A lab computer with:

    -   Access to Microsoft Azure

    -   A modern web browser (Microsoft Edge, Google Chrome, or Mozilla Firefox)

> **Note**: The lab computer does not require locally installed software for the hands-on-lab setup guide. 

> **Note**: There are additional requirements to run the lab. For details, refer to [HOL step-by-step - SAP HANA on Azure](./Hands-on%20lab/HOL%20step-by-step%20-%20SAP%20HANA%20on%20Azure.md)


## Before the hands-on lab

Duration: 15 minutes

To complete this lab, you must verify that your account has sufficient permissions to the Azure subscription that you intend to use to deploy all required Azure resources. The Azure subscription must have a sufficient number of available vCPUs. You also need to identify the availability of the SUSE Linux Enterprise Server image that you will use to deploy Azure VMs.

### Task 1: Validate the owner role assignment in the Azure subscription

1.  From the lab computer, start a web browser, navigate to [the Azure portal](http://portal.azure.com), sign in with credentials you will be using in this lab. 

1.  In the Azure portal, use the **Search resources, services, and docs** text box to search for **Subscriptions** and, in the list of results, select **Subscriptions**.

1.  On the **Subscriptions** blade, select the name of the subscription you intend to use for this lab.

1.  On the subscription blade, select **Access control (IAM)**.

1.  Switch to the **Role assignments** tab, review the list of role assignments, and verify that your user account has the Owner role assigned to it.

### Task 2: Validate the availability of the SUSE Linux Enterprise Server image

1.  In the Azure portal, select the **Cloud Shell** icon.

1.  If prompted, in the **Welcome to Azure Cloud Shell** window, select **Bash (Linux)**.

1.  If prompted, in the **You have no storage mounted** window, select **Create storage**.

1.  Once the storage account gets provisioned, at the Bash prompt, run the following: where the `[location]` placeholder designates the target Azure region that you intend to use for this lab (e.g., `eastus`), and verify the output includes an existing image:

    ```sh
    LOCATION='[location]`
    <!-- az vm image list --location $LOCATION --publisher SUSE --offer SLES-SAP --sku 12-SP3 --all --output table -->
    az vm image list --location $LOCATION --publisher SUSE --offer sles-sap-12-sp5 --sku gen1 --all --output table
    ``` 

    > **Note**: To identify the names of Azure regions, in the **Cloud Shell**, at the Bash prompt, run `az account list-locations --query '[].name' --output tsv`
     
### Task 3: Validate a sufficient number of vCPU cores

1.  In the Azure portal, in the **Cloud Shell**, at the Bash prompt, run the following: where the `[LOCATION]` placeholder designates the target Azure region that you intend to use for this lab (e.g., `eastus`):

    ```sh
    LOCATION='[location]`  
    az vm list-usage --location $LOCATION --query "[?localName == 'Standard DSv3 Family vCPUs'].{VMFamily:localName, currentValue:currentValue, Limit:limit}" --output table
    ``` 
   
1.  Review the output of the command executed in the previous step and ensure that you have at least 26 available vCPUs in the **Standard DSv3 Family** VM family.

1.  If the number of vCPUs is not sufficient, in the Azure portal, navigate back to the subscription blade, and select **Usage + quotas**. 

1.  On the subscription's **Usage + quotas** blade, select **Request Increase**.

1.  On the **Basic** blade, specify the following and select **Next: Solutions >**:

    -   Issue type: **Service and subscription limits (quotas)**

    -   Subscription: the name of the Azure subscription you will be using in this lab.

    -   Quota type: **Compute-VM (cores-vCPUs) subscription limit increases**

    -   Support plan: the name of the support plan associated with the target subscription.

1.  On the **Details** blade, select the **Provide details** link.

1.  On the **Quota details** blade, specify the following and select **Save and continue**:

    -   Deployment model: **Resource Manager**

    -   Location: the target Azure region you intend to use in this lab.

    -   Types: **Standard**

    -   Standard: **DSv3 Series** 
    
    -   New vCPU Limit: the new limit

1.  Back on the **Details** blade, specify the following and select **Next: Review + create >**:

    -   Severity: **C - Minimal impact**

    -   Preferred contact method: choose your preferred option and provide your contact details
    
1.  On the **Review + create** blade, select **Create**.

   > **Note**: Typically, quota increases requests are completed within a few hours, but it is possible that their processing might take up to a few days.

You should follow all steps provided *before* performing the Hands-on lab.
