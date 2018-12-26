output "name" {
  description = "Azure Resource Group name"
  value       = data.azurerm_resource_group.rg.name
}

output "tags" {
  description = "Azure Resource Group tags"
  value       = merge(data.azurerm_resource_group.rg.tags, var.tags)
}
