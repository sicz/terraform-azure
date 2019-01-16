# Azure resource name module

Manages an [Azure resource name](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions).

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
variable "project" {}
variable "location" {}

module "rg_name" {
  source     = "github.com/sicz/terraform-azure/resource-name"
  name       = var.project
  location   = var.location
  separator  = "-"
  max_length = 80

  # Insert optional input variables here
}

module "rg" {
  source   = "github.com/sicz/terraform-azure/resource-group"
  name     = module.rg_name.result
  location = var.location

  # Insert optional input variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
