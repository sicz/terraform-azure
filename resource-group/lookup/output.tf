locals {
  exists = data.external.azurerm_resource_group.result.id != ""
}

output "exists" {
  description = "Returns `true` if Azure Resource Group exists otherwise returns `false`"
  value       = local.exists
}

output "id" {
  description = "Azure Resource Group id or null if it does not exists"

  value       = (local.exists ?
    data.external.azurerm_resource_group.result.id :
    null
  )
}

output "name" {
  description = "Azure Resource Group name"
  value       = var.name
}

output "location" {
  description = "Azure Resource Group location"
  value       = (local.exists ?
    data.external.azurerm_resource_group.result.location :
    var.location
  )
}

output "tags" {
  description = "Azure Resource Group tags"
  value       = (length(keys(data.external.azurerm_resource_group_tags.result)) > 0 ?
    data.external.azurerm_resource_group_tags.result :
    null
  )
}
