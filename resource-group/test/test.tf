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

module "rg1" {
  source       = "../lookup"
  name         = random_uuid.resource_group_name.result
}

output "rg1_name" {
  value = module.rg1.name
}

output "rg1_tags" {
  value = module.rg1.tags
}

################################################################################

module "rg2" {
  source       = "../"
  name         = module.rg1.name
  location     = var.location
  tags         = merge(local.tags, {rg2 = "rg2"})
}

output "rg2_name" {
  value = module.rg2.name
}

output "rg2_location" {
  value = module.rg2.location
}

output "rg2_tags" {
  value = module.rg2.tags
}

################################################################################

module "rg3" {
  source       = "../tags"
  name         = module.rg2.name
  tags         = {rg3 = "rg3"}
}

output "rg3_name" {
  value = module.rg3.name
}

output "rg3_tags" {
  value = module.rg3.tags
}

################################################################################
