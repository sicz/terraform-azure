# Azure Resource Group lookup module

Look up the tags of the existing Azure Resource Group.

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

module "resource_group_lookup" {
  source = "github.com/sicz/terraform-azure/resource-group/lookup"
  name   = "${var.resource_group_name}"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Azure Resource Group name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | Azure Resource Group name |
| tags | Azure Resource Group tags |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
