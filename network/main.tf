resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.resource_group_name
  name                = var.name == null ? "${var.resource_group_name}_vnet" : var.name
  location            = var.location
  address_space       = split(",", var.address_space)
  dns_servers         = var.dns_servers == null ? null : split(",", var.dns_servers)
}

module "subnet" {
  source                    = "./subnet"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  subnets                   = var.subnets == null ? [] : var.subnets
  network_security_group_id = var.network_security_group_id
  route_table_id            = var.route_table_id
}
