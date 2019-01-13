output "id" {
  description = "Azure Virtual Network id"
  value       = azurerm_virtual_network.vnet.id
}

output "name" {
  description = "Azure Virtual Network name"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  description = "Azure Subnet ids"
  value       = module.subnet.ids
}
