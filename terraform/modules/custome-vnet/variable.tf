# variables.tf

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "The Azure location for the Virtual Network and Resource Group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "The name of the AKS subnet"
  type        = string
}

variable "aks_subnet_address_prefix" {
  description = "The address prefix for the AKS subnet"
  type        = string
}
