################################################################################

variable "environment" {
  description = "Azure Resource Group environment tag"
  type        = string
  default     = "ci"
}

resource "random_uuid" "resource_group_name" {
  keepers = {
    keep = true
  }
}

################################################################################

module "rg_lookup1" {
  source = "../lookup"
  name   = random_uuid.resource_group_name.result
}

output "rg_lookup1_location" {
  value = "${module.rg_lookup1.location == null ? "null" : module.rg_lookup1.location}"
}

output "rg_lookup1_tags" {
  value = module.rg_lookup1.tags
}

################################################################################

module "rg" {
  source   = "../"
  name     = module.rg_lookup1.name
  location = "eastus"

  tags = {
    environment = var.environment
    rg          = "rg"
  }
}

output "rg_id" {
  value = module.rg.id
}

output "rg_name" {
  value = module.rg.name
}

output "rg_location" {
  value = module.rg.location
}

output "rg_tags" {
  value = module.rg.tags
}

################################################################################

module "rg_lookup2" {
  source = "../lookup"
  name   = module.rg.name
}

output "rg_lookup2_location" {
  value = "${module.rg_lookup2.location == null ? "null" : module.rg_lookup2.location}"
}

output "rg_lookup2_tags" {
  value = module.rg_lookup2.tags
}

################################################################################
