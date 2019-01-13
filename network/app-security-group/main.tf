resource "azurerm_application_security_group" "asg" {
  resource_group_name = var.resource_group_name
  name                = var.name == null ? "${var.resource_group_name}_asg" : var.name
  location            = var.location
  tags                = var.tags
}
