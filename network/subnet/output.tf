output "ids" {
  description = "Azure Network Subnet ids"
  value       = azurerm_subnet.subnet.*.id
}
