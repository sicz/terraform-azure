locals {
  max_length = 80

  length = (var.length == null ?
    local.max_length :
    min(var.length, local.max_length)
  )
}

module "rg_name" {
  source                    = "../../resource-name"
  name                      = var.name
  environment               = var.environment
  location                  = var.location
  role                      = var.role
  instance                  = var.instance
  unique                    = var.unique
  delimiter                 = var.delimiter
  length                    = local.length
  max_length                = 90
  hyphen_allowed            = var.hyphen_allowed
  period_allowed            = var.period_allowed
  underscore_allowed        = var.underscore_allowed
  lowercase                 = var.lowercase
  uppercase                 = var.uppercase
}
