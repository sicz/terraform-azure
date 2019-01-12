# Azure Resource Group lookup module

Looks up the Azure Resource Group.

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
variable location {}

module "rg_lookup" {
  source   = "github.com/sicz/terraform-azure/resource-group/lookup"
  name     = var.resource_group_name
  location = var.location
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
