output "location" {
  description = "Azure Resource Group location"
  value       = "${data.external.azurerm_resource_group_location.result["location"]}"
}

output "tags" {
  description = "Azure Resource Group tags"
  value       = "${data.external.azurerm_resource_group_tags.result}"
}
