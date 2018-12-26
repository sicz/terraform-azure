# Azure Resource Group tag module

Manages the Azure Resource Group tags. Preserves its unattended tags.

**WARNING: Each tag must only be managed once using `resource-group` or
`resource-group/tags` modules and can not be renamed or deleted!
Otherwise, unpredictable problems may occur.**

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

module "resource_group_tags" {
  source              = "github.com/sicz/terraform-azure/resource-group/tags"
  resource_group_name = "${var.resource_group_name}"
  tags                = { TAG_NAME = "TAG_VALUE" }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Azure Resource Group name | string | - | yes |
| tags | Azure Resource Group tags | map | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | Azure Resource Group name |
| tags | Azure Resource Group tags |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
