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

module "rg1" {
  source = "../lookup"
  name   = random_uuid.resource_group_name.result
}

output "rg1_name" {
  value = module.rg1.name
}

output "rg1_tags" {
  value = module.rg1.tags
}

################################################################################

module "rg2" {
  source   = "../"
  name     = module.rg1.name
  location = "eastus"

  tags = {
    environment = var.environment
    rg2         = "rg2"
  }
}

output "rg2_id" {
  value = module.rg2.id
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
  source = "../tags"
  name   = module.rg2.name

  tags = {
    rg3 = "rg3"
  }
}

output "rg3_name" {
  value = module.rg3.name
}

output "rg3_tags" {
  value = module.rg3.tags
}

################################################################################

module "rg4" {
  source = "../lookup"
  name   = module.rg3.name
}

output "rg4_name" {
  value = module.rg4.name
}

output "rg4_tags" {
  value = module.rg4.tags
}

################################################################################
