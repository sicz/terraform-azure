output "id" {
  description = "Azure Network Security Group id"
  value       = azurerm_network_security_group.nsg.id
}

output "name" {
  description = "Azure Network Security Group name"
  value       = azurerm_network_security_group.nsg.name
}

output "priority_offset" {
  description = "Next Azure Network Security Rule priority offset"
  value       = module.nsr.priority_offset
}
