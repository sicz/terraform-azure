output "name" {
  description = "Azure Resource Group name"
  value       = var.name
}

output "tags" {
  description = "Azure Resource Group tags"
  value       = data.external.azurerm_resource_group_tags.result
}
