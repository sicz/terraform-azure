output "id" {
  description = "Azure Application Security Group id"
  value       = azurerm_application_security_group.asg.id
}

output "name" {
  description = "Azure Application Security Group name"
  value       = azurerm_application_security_group.asg.name
}
