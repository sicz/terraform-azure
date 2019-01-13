# Azure Route module

Manages the [Azure Route Table entries](https://www.terraform.io/docs/providers/azurerm/r/route.html).

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

  # Insert optional input variables here
}

module "rt_entries" {
  source              = "github.com/sicz/terraform-azure/network/route"
  resource_group_name = module.rg.name
  route_table_name    = module.rt.name

  routes = [
    {
      address_prefix         = "10.3.0.0/24"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.1.0.1"
    },
  ]
}
```

### Routes

The `routes` attribute is a list of maps with the following structure:

* `address_prefix` - Remote network address prefix.
* `next_hop_type` - Next hop type.
* `next_hop_in_ip_address` - next hop IP address for `VirtualAppliance` next hop
  type.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
