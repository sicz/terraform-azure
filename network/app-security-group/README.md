# Azure Application Security Group module

Manages an [Azure Application Security Group](https://www.terraform.io/docs/providers/azurerm/r/application_security_group.html).

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

module "rg" {
  source   = "github.com/sicz/terraform-azure/resource-group"
  name     = var.resource_group_name
  location = var.location

  # Insert optional input variables here
}

module "asg" {
  source              = "github.com/sicz/terraform-azure/network/security/app-group"
  resource_group_name = module.rg.name
  location            = module.rg.location

  # Insert optional input variables here
}

module "nsg" {
  source              = "github.com/sicz/terraform-azure/network/security/group"
  resource_group_name = module.rg.name
  location            = module.rg.location

  default_rule = {
    destination_application_security_group_ids = module.asg.id
  }

  # Insert optional input variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
