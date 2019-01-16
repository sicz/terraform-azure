# Azure Virtual Network name module

Manages an [Azure Virtual Network name](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions).

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

  # Insert optional input variables here
}

module "vnet_name" {
  source    = "github.com/sicz/terraform-azure/network/name"
  name      = module.rg.name

  # Insert optional input variables here
}

module "nsg_name" {
  source    = "github.com/sicz/terraform-azure/network/name"
  name      = module.rg.name
  role      = "nsg"

  # Insert optional input variables here
}

module "route_table_name" {
  source    = "github.com/sicz/terraform-azure/network/name"
  name      = module.rg.name
  role      = "route_table"

  # Insert optional input variables here
}

module "vnet" {
  source              = "github.com/sicz/terraform-azure/network"
  resource_group_name = module.rg.name
  name                = module.vnet_name.result
  location            = module.rg.location

  # Insert required and optional input variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
