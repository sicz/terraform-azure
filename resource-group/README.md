# Azure Resource Group module

Create an Azure Resource Group. Preserves the location and unattended tags of
an existing resource group.

## Submodules

* [resource-group/lookup](lookup/README.md) - Look up the location and tags of
  the existing Azure Resource Group.

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

module "resource_group" {
  source = "github.com/sicz/terraform-azure/resource_group"
  name   = "${var.resource_group_name}"

  # Insert optional input variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| location | Azure Resource Group location. | string | `eastus` | no |
| name | Azure Resource Group name. | string | - | yes |
| tags | Azure Resource Group tags. | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Azure Resource Group id. |
| location | Azure Resource Group location. |
| name | Azure Resource Group name. |
| tags | Azure Resource Group tags. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
