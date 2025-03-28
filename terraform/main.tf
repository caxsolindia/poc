# main.tf

# Define the resource group (only one instance)
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Call the custom VNet module once
module "custome-vnet" {
  source                    = "./modules/custome-vnet"
  vnet_name                 = var.vnet_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  address_space             = [var.address_space]
  aks_subnet_name           = var.aks_subnet_name
  aks_subnet_address_prefix = cidrsubnet(var.address_space, 8, 1) # Calculate AKS subnet prefix
}

# Call the AKS cluster module, using the custom VNet and its subnet
module "aks_cluster" {
  source                = "./modules/aks-cluster"
  aks_cluster_name      = var.aks_cluster_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  dns_prefix            = var.dns_prefix
  node_count            = var.node_count
  node_vm_size          = var.node_vm_size
  subnet_id             = module.custome-vnet.subnet_id

}
