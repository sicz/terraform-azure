output "name" {
  description = "Azure Resource Group name"
  value       = azurerm_resource_group.rg.name
}

output "location" {
  description = "Azure Resource Group location"
  value       = azurerm_resource_group.rg.location
}

output "tags" {
  description = "Azure Resource Group tags"
  value       = azurerm_resource_group.rg.tags
}
