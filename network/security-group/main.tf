resource "azurerm_network_security_group" "nsg" {
  resource_group_name = var.resource_group_name
  name                = var.name == null ? "${var.resource_group_name}_nsg" : var.name
  location            = var.location
  tags                = var.tags
}

module "nsr" {
  source                      = "../security-rule"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
  priority_offset             = var.priority_offset
  security_rules              = var.security_rules == null ? [] : var.security_rules
  default_rule                = var.default_rule
}
