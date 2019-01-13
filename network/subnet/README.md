# Azure Subnets module

Manages an [Azure Subnet](https://www.terraform.io/docs/providers/azurerm/r/subnet.html).

## Prerequisites

On Apple macOS, install [Homebrew](http://brew.sh/) and packages:
```bash
brew install azure-cli
brew install jq
brew install terraform
```
On other platforms, install the appropriate packages.

## Usage

Copy and paste into your Terraform configuration, insert the variables, and
run `terraform init`:
```hcl
variable "resource_group_name" {}
variable "location" {}

module "rg" {
  source   = "github.com/sicz/terraform-azure/resource-group"
  name     = var.resource_group_name
  location = var.location

  # Insert required and optional input variables here
}

module "rt" {
  source              = "github.com/sicz/terraform-azure/network/route-table"
  resource_group_name = var.resource_group_name
  location            = var.location

  # Insert required and optional input variables here
}

module "nsg" {
  source              = "github.com/sicz/terraform-azure/network/security-group"
  resource_group_name = var.resource_group_name
  location            = var.location

  # Insert required and optional input variables here
}

module "vnet" {
  source              = "github.com/sicz/terraform-azure/network"
  resource_group_name = var.resource_group_name
  location            = var.location

  # Insert required and optional input variables here
}

module "subnet" {
  source              = "github.com/sicz/terraform-azure/network"
  resource_group_name = var.resource_group_name
  location            = var.location

  subnets = [
    {
      address_prefix = "10.1.0.0/24"
      # Insert optional subnet configuration here
    }, {
      address_prefix = "10.1.1.0/24"
      # Insert optional subnet configuration here
    },
  ]

  network_security_group_id = module.nsg.id
  route_table_id            = module.rt.id
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
