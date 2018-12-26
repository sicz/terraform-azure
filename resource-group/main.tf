module "rg_lookup" {
  source = "./lookup"
  name   = var.name
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = merge(module.rg_lookup.tags, var.tags)
}
