resource "azurerm_route" "route" {
  count               = length(var.routes)
  resource_group_name = var.resource_group_name
  route_table_name    = var.route_table_name

  name = (lookup(var.routes[count.index], "name", null) == null ?
    replace("route_${var.routes[count.index].address_prefix}", "/", "_") :
    var.routes[count.index].name
  )

  address_prefix         = var.routes[count.index].address_prefix
  next_hop_type          = var.routes[count.index].next_hop_type
  next_hop_in_ip_address = lookup(var.routes[count.index], "next_hop_in_ip_address", null)
}
