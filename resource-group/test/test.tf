################################################################################

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "test"
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Azure resources tags"
  type        = map(string)
  default     = null
}

locals {
  tags = merge(var.tags == null ? {} : var.tags, {environment = var.environment})
}

################################################################################

resource "random_uuid" "resource_group_name" {
  keepers = {
    keep = true
  }
}

module "rg_lookup_nonexistent" {
  source   = "../lookup"
  name     = random_uuid.resource_group_name.result
  location = var.location
}

output "rg_lookup_nonexistent" {
  value = module.rg_lookup_nonexistent
}

################################################################################

module "rg" {
  source       = "../"
  name         = module.rg_lookup_nonexistent.name
  location     = module.rg_lookup_nonexistent.location
  tags         = local.tags
}

output "rg" {
  value = module.rg
}

################################################################################

module "rg_lookup_existent" {
  source   = "../lookup"
  name     = module.rg.name
  location = "westus"
}

output "rg_lookup_existent" {
  value = module.rg_lookup_existent
}

################################################################################

module "rg_tag" {
  source              = "../tag"
  resource_group_name = module.rg_lookup_existent.name
  name                = "managed_tag"
  value               = "value"
}

output "rg_tag" {
  value = module.rg_tag
}

################################################################################
