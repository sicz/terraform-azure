# Azure Network module

Manages an [Azure Virtual Network](https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html).

## Submodules

* [network/app-security-group](app-security-group/README.md) - Manages an
  [Azure Application Security Group](https://www.terraform.io/docs/providers/azurerm/r/application_security_group.html).
* [network/name](name/README.md) - Manages an
  [Azure Virtual Network name](https://docs.microsoft.com/en-us/azure/architecture/best-practices/naming-conventions).
* [network/route](route/README.md) - Manages an
  [Azure Route Table entries](https://www.terraform.io/docs/providers/azurerm/r/route.html).
* [network/route-table](route-table/README.md) - Manages an
  [Azure Route Table](https://www.terraform.io/docs/providers/azurerm/r/route-table.html).
* [network/security-group](security-group/README.md) - Manages an
  [Azure Network Security Group](https://www.terraform.io/docs/providers/azurerm/r/network_security_group.html).
* [network/security-rule](security-rule/README.md) - Manages an
  [Azure Network Security Rules](https://www.terraform.io/docs/providers/azurerm/r/network_security_rule.html).
* [network/subnet](subnet/README.md) - Manages an
  [Azure Network Subnet](https://www.terraform.io/docs/providers/azurerm/r/subnet.html).

## Recommended readings

* [Azure Networking Limits](https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits#azure-resource-manager-virtual-networking-limits)
* [Azure Network Security Best Practices](https://docs.microsoft.com/en-us/azure/security/azure-security-network-security-best-practices)
* [NSG – Best Practices and Lessons Learned](https://blogs.msdn.microsoft.com/igorpag/2016/05/14/azure-network-security-groups-nsg-best-practices-and-lessons-learned/)

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

  # Insert required and optional input variables here
}

module "nsg" {
  source              = "github.com/sicz/terraform-azure/network/security-group"
  resource_group_name = module.rg.name
  location            = module.rg.location

  # Insert required and optional input variables here
}

module "vnet" {
  source              = "github.com/sicz/terraform-azure/network"
  resource_group_name = module.rg.name
  location            = module.rg.location

  address_space       = "10.1.0.0/16"

  subnets = [
    {
      address_prefix = "10.1.0.0/24"
      # Insert optional subnet configuration here
    }, {
      address_prefix = "10.1.1.0/24"
      # Insert optional subnet configuration here
    },
  ]

  network_security_group_id = module.nsg.id
  route_table_id            = module.rt.id

  # Insert optional input variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
