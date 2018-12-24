output "name" {
  description = "Azure Resource Group name"
  value       = var.name
}

output "location" {
  description = "Azure Resource Group location"
  value       = local.location
}

output "tags" {
  description = "Azure Resource Group tags"
  value       = data.external.azurerm_resource_group_tags.result
}
