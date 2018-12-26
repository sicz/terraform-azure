output "name" {
  description = "Azure Resource Group name"
  value       = data.azurerm_resource_group.rg.name
}

output "tags" {
  description = "Azure Resource Group tags"

  # data.azurerm_resource_group.rg should depend on
  # null_resource.azurerm_resource_group_tag but local-exec provisioner does
  # not honor this, so we have to merge the original tags with the new ones.
  # https://github.com/hashicorp/terraform/issues/18303#issuecomment-403653608
  value = merge(data.azurerm_resource_group.rg.tags, var.tags)
}
