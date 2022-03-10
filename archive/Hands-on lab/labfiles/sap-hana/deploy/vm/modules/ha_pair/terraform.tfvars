# Azure region to deploy resource in; please choose the same region as your storage from step 3 (example: "westus2") 
az_region = "VAR_LOCATION"

# Name of resource group to deploy (example: "demo1")
az_resource_group = "VAR_RESOURCE_GROUP"

# Unique domain name for easy VM access (example: "hana-on-azure1")
# Domain name should be all lower case and have no special characters except '-'.
az_domain_name = "VAR_DOMAIN_NAME"

# Size of the VM to be deployed (example: "Standard_E8s_v3")
# For HANA platform edition, a minimum of 32 GB of RAM is recommended
vm_size = "VAR_VM_SIZE"

# Path to the public SSH key to be used for authentication (e.g. "~/.ssh/id_rsa.pub")
sshkey_path_public = "~/.ssh/id_rsa.pub"

# Path to the corresponding private SSH key (e.g. "~/.ssh/id_rsa")
sshkey_path_private = "~/.ssh/id_rsa"

# OS user with sudo privileges to be deployed on VM (e.g. "demo")
vm_user = "VAR_VM_USERNAME"

# SAP system ID (SID) to be used for HANA installation (example: "HN1")
sap_sid = "HN1"

# SAP instance number to be used for HANA installation (example: "01")
sap_instancenum = "01"

# URL to download Linux 64-bit SAPCAR binary from (see step 6)
url_sap_sapcar_linux = "VAR_SAPCAR_LINUX_URL"

# URL to download Windows 64-bit SAPCAR binary from
url_sapcar_windows = "VAR_SAPCAR_WINDOWS_URL"

# URL to download HANA DB server package from (see step 6)
url_sap_hdbserver = "VAR_HDBSERVER_URL"

# URL to download HANA STUDIO for Windows server package from
url_hana_studio_windows = "VAR_HANA_STUDIO_WINDOWS_URL"

# URL to download SAP HOST AGENT package from
url_sap_hostagent = "VAR_SAP_HOST_AGENT_URL"

# Password for the OS sapadm user
pw_os_sapadm = "VAR_SAPADMUSER_PASSWORD"

# Password for the OS <sid>adm user
pw_os_sidadm = "VAR_ADMUSER_PASSWORD"

# Password for the DB SYSTEM user
# (In MDC installations, this will be for SYSTEMDB tenant only)
pw_db_system = "VAR_DBSYSTEMUSER_PASSWORD"

# Password for the DB XSA_ADMIN user
pwd_db_xsaadmin = "VAR_DBXSAADMIN_PASSWORD"

# Password for the DB SYSTEM user for the tenant DB (MDC installations only)
pwd_db_tenant = "VAR_DBSYSTEMTENANTUSER_PASSWORD"

# Password for the DB SHINE_USER user (SHINE demo content only)
pwd_db_shine = "VAR_DBSHINEUSER_PASSWORD"

# e-mail address used for the DB SHINE_USER user (SHINE demo content only)
email_shine = "shine@emailaddress.com"

# Set this flag to true when installing HANA 2.0 (or false for HANA 1.0)
useHana2 = false

# Set this flag to true when installing the XSA application server
install_xsa = false

# Set this flag to true when installing SHINE demo content (requires XSA)
install_shine = false

# Set this flag to true when installing Cockpit (requires XSA)
install_cockpit = false

# Set this flag to true when installing WebIDE (requires XSA)
install_webide = false

# Set this flag to false to install HDB with single containers (tenants)
hdb_mdc = false
hana1_db_mode = "single_container"

# Set this flag to true to install the Windows bastion host
windows_bastion = true

# Password for the Windows bastion host admin user
pw_bastion_windows = "VAR_WINDOWS_ADMIN_PASSWORD"

# Password for the HA cluster nodes
pw_hacluster = "VAR_HA_CLUSTER_NODES_PASSWORD"