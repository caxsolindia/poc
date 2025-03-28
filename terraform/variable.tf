# modules/aks-cluster/variables.tf

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location for the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where AKS will be deployed"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "The VM size for the AKS node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "subnet_id" {
  description = "The ID of the subnet where the AKS nodes will be deployed"
  type        = string
}

variable "vnet_name" {
  type        = string
}

variable "address_space" {
  type        = string
}

variable "aks_subnet_name" {
  type        = string
}