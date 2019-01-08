output "tags" {
  description = "Azure Resource Group tags"
  value       = merge(data.azurerm_resource_group.rg.tags, var.tags)
}
