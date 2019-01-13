resource "azurerm_route_table" "rt" {
  resource_group_name = var.resource_group_name
  name                = var.name == null ? "${var.resource_group_name}_route_table" : var.name
  location            = var.location

  disable_bgp_route_propagation = var.disable_bgp_route_propagation
}

module "route" {
  source              = "../route"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.rt.name
  routes              = var.routes == null ? [] : var.routes
}
