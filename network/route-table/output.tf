output "id" {
  description = "Azure Route Table id"
  value       = azurerm_route_table.rt.id
}

output "name" {
  description = "Azure Route Table name"
  value       = azurerm_route_table.rt.name
}

output "route_ids" {
  description = "Azure Route ids"
  value       = module.route.ids
}
