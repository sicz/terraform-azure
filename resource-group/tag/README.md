# Azure Resource Group tag module

Manages the Azure Resource Group tags.

**WARNING: Each tag must be managed only once by using the `resource-group` or
`resource-group/tags` module and can not be renamed! Otherwise, unpredictable
problems may occur.**

**There is [Terraform bug](https://github.com/hashicorp/terraform/issues/13549)
that prevents this module from deleting the tag.**

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
variable "tags" {}

module "rg"{
  source   = "github.com/sicz/terraform-azure/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "rg_tag" {
  source              = "github.com/sicz/terraform-azure/resource-group/tag"
  resource_group_name = module.rg.name
  name                = "TAG_NAME"
  value               = "TAG_VALUE"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
