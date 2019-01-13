# Azure Network Security Rules module

Manages an [Azure Network Security Rules](https://www.terraform.io/docs/providers/azurerm/r/network_security_rule.html).

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

  # Insert optional input variables here
}

module "nsr" {
  source                      = "github.com/sicz/terraform-azure/network/security/group"
  resource_group_name         = module.rg.name
  network_security_group_name = module.nsg.name
  priority_offset             = module.nsg.priority_offset

  security_rules = [
    { rule = "ssh" },
    { rule = "http" },
  ]

  default_rule = {
    access                     = "Allow"
    source_address_prefix      = "Internet"
    destination_address_prefix = "VirtualNetwork"
  }
}
```

### Security rules

The `security_rules` attribute is a list of maps with the following structure:

* `rule` - Name of the rule template from:
  * [Application rules](app_rule_templates.tf).
  * [Protocol rules](protocol_rule_templates.tf).
  * [Microsoft_rules](microsoft_rule_templates.tf).
  * Custom rule templates specified in `rule_templates` input argument.

* `priority` - Unique rule number. If not defined, the rule is numbered with
  `priority_offset` + `count.index`. The `priority_offset` output variable can
  be used as input for the next call to this module.

* `name` - Rule name. If not defined, the rule template name or `"rule"` is used.
  Default value is `"rule"`. The rule number is always attached to the rule name.

* `access` - `"Allow"` or `"Deny"` traffic. Default value is `"Allow"`.

* `direction` - `Inbound` or `Outbound`.

* `protocol` - `"Tcp"`, `"Udp"` or `"*"` protocol. Default value is `"Tcp"`.

* `source_port_ranges` - Comma-separated list of source port ranges.
  `"*"` means any port. Default value is `"*"`

* `source_address_prefix` - Source address prefix. `"*"` means any address.
  You can also use
  [Service tags](https://docs.microsoft.com/en-us/azure/virtual-network/security-overview#service-tags).
  Default value is `"*"`. This attribute is mutually exclusive with
  `source_address_prefixes` and `source_application_security_group_ids`.

* `source_address_prefixes` - Comma-separated list of source address prefixes.
  You cannot use Service tags. Default value is not defined. This attribute is
  mutually exclusive with `source_address_prefix` and
  `source_application_security_group_ids`.

> **Due to a [terraform 0.12-alpha bug](https://github.com/hashicorp/terraform/issues/19900),
> this attribute is ignored now.**

* `source_application_security_group_ids` - Comma-separated list of source
  Application Security Group ID's. Default value is not defined. This attribute
  is mutually exclusive with `source_address_prefix` and `source_address_prefixes`.


* `destination_port_ranges` - Comma-separated list of destination port ranges.
  `"*"` means any port. Default value is `"*"`.

* `destination_address_prefix` - Destination address prefix. `"*"` means any
  address. You can also use
  [Service tags](https://docs.microsoft.com/en-us/azure/virtual-network/security-overview#service-tags).
  Default value is `"*"`. This attribute is mutually exclusive with
  `destination_address_prefixes` and `destination_application_security_group_ids`.

* `destination_address_prefixes` - Comma-separated list of destination address
  prefixes. You cannot use Service tags. Default value is not defined. This
  attribute is mutually exclusive with `destination_address_prefix` and
  `destination_application_security_group_ids`.

> **Due to a [terraform 0.12-alpha bug](https://github.com/hashicorp/terraform/issues/19900),
> this attribute is ignored now.**

* `destination_application_security_group_ids` - Comma-separated list of
  destination Application Security Group ID's. Default value is not defined.
  This attribute is mutually exclusive with `destination_address_prefix` and
  `destination_address_prefixes`.

The `rule_templates` attribute is intended to add custom rule templates.

The `default_rule` attribute is intended to override the default rule values
(except `rule`, `priority` and `description`) that is usually used to specify
the source and destination address prefixes.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
