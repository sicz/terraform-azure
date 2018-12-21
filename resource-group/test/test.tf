variable "environment" {
  description = "Azure Resource Group environment tag"
  default     = "ci"
}

resource "random_uuid" "resource_group_name" {
  keepers {
    keep = true
  }
}

module "rg1" {
  source   = ".."
  name     = "${random_uuid.resource_group_name.result}"
  location = "eastus"

  tags = {
    environment = "${var.environment}"
    rg1         = "rg1"
  }
}

module "rg2" {
  source   = ".."
  name     = "${module.rg1.name}"
  location = "westus"

  tags = {
    rg2 = "rg2"
    rg1 = "rg2"
  }
}

output "resource_group_id" {
  value = "${module.rg2.id}"
}

output "resource_group_name" {
  value = "${module.rg2.name}"
}

output "resource_group_location" {
  value = "${module.rg2.location}"
}

output "resource_group_tags" {
  value = "${module.rg2.tags}"
}
