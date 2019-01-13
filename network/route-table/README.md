# Azure Network module

Manages an [Azure Route Table](https://www.terraform.io/docs/providers/azurerm/r/route_table.html).

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

module "rt" {
  source              = "github.com/sicz/terraform-azure/network/route-table"
  resource_group_name = module.rg.name
  location            = module.rg.location

  routes = [
    {
      address_prefix         = "10.3.0.0/24"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.1.0.1"
    },
  ]

  # Insert optional input variables here
}
```

### Routes

The `routes` attribute is a list of maps. Its structure is described in the
[network/route](../route/README.md#routes) module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
