# Azure Network Security Group module

Manages an [Azure Network Security Group](https://www.terraform.io/docs/providers/azurerm/r/network_security_group.html).

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

module "nsg" {
  source              = "github.com/sicz/terraform-azure/network/security/group"
  resource_group_name = module.rg.name
  location            = module.rg.location

  security_rules = [
    { rule = "ssh" },
    { rule = "http" },
  ]

  default_rule = {
    access                     = "Allow"
    source_address_prefix      = "Internet"
    destination_address_prefix = "VirtualNetwork"
  }

  # Insert optional input variables here
}
```

### Security Rules

The `security_rules` attribute is a list of maps. Its structure is described in
the [security_rule](../security_rule/README.md#security_rules) module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
