output "ids" {
  description = "Azure Route ids"
  value       = azurerm_route.route.*.id
}
