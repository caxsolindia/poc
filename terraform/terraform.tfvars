# terraform.tfvars

# Resource Group Configuration
resource_group_name = "pavan_peopleanalytics_rg"
location            = "Central India"

# Virtual Network Configuration
vnet_name           = "custom-aks-vnet"
address_space       = "10.0.0.0/16"

# Subnet Configuration for AKS
aks_subnet_name         = "aks-subnet"
# aks_subnet_address_prefix = "10.2.1.0/24"  # Provide as a string, not a list

# AKS Cluster Configuration
aks_cluster_name = "pavan-aks-cluster"
dns_prefix   = "pavanaks"  # Example DNS prefix for AKS
node_count   = 3  # Number of nodes
node_vm_size = "Standard_DS2_v2"  # VM size for AKS nodes
