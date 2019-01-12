# Azure Resource Group module

Manages an [Azure Resource Group](https://www.terraform.io/docs/providers/azurerm/r/resource_group.html).
Preserves existing tags.

## Submodules

* [resource-group/lookup](lookup/README.md) - Looks up the Azure Resource Group.
* [resource-group/tag](tag/README.md) - Manages the Azure Resource Group tags.

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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
