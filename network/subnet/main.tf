resource "azurerm_subnet" "subnet" {
  count                = length(var.subnets)
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name

  name = (lookup(var.subnets[count.index], "name", null) == null ?
    replace("${var.virtual_network_name}_${var.subnets[count.index].address_prefix}", "/", "_") :
    var.subnets[count.index].name
  )

  address_prefix = var.subnets[count.index].address_prefix

  service_endpoints = (lookup(var.subnets[count.index], "service_endpoints", null) == null ?
    null :
    split(",", var.subnets[count.index].service_endpoints)
  )

  # TODO: The following arguments are deprecated and will be removed in the next
  # major version (2.0) of the AzureRM Provider, but are required until then
  network_security_group_id = var.network_security_group_id
  route_table_id            = var.route_table_id
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  count                     = length(var.subnets)
  network_security_group_id = var.network_security_group_id
  subnet_id                 = azurerm_subnet.subnet[count.index].id
}

resource "azurerm_subnet_route_table_association" "rt_association" {
  count          = length(var.subnets)
  route_table_id = var.route_table_id
  subnet_id      = azurerm_subnet.subnet[count.index].id
}
