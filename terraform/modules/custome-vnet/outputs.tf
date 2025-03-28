output "subnet_id" {
  description = "The ID of the AKS subnet"
  value       = azurerm_subnet.aks_subnet.id # Assuming this is the resource name for your AKS subnet
}