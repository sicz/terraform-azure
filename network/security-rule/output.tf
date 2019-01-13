output "ids" {
  description = "Azure Network Security Rule ids"
  value       = azurerm_network_security_rule.nsr.*.id
}

output "priority_offset" {
  description = "Next Azure Network Security Rule priority offset"
  value       = var.priority_offset + length(var.security_rules)
}
