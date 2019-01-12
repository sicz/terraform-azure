module "rg_lookup" {
  source   = "./lookup"
  name     = var.name
  location = var.location
}

locals {
  merged_tags = merge(
    module.rg_lookup.tags == null ? {} : module.rg_lookup.tags,
    var.tags == null ? {} : var.tags
  )

  tags = length(keys(local.merged_tags)) > 0 ? local.merged_tags : null
}

resource "azurerm_resource_group" "rg" {
  name     = module.rg_lookup.name
  location = module.rg_lookup.location
  tags     = local.tags
}
