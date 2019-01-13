################################################################################

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "test"
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Azure resources tags"
  type        = map(string)
  default     = null
}

locals {
  tags = merge(var.tags == null ? {} : var.tags, {environment = var.environment})
}

################################################################################

resource "random_uuid" "resource_group_name" {
  keepers = {
    keep = true
  }
}

module "rg" {
  source       = "../../resource-group"
  name         = random_uuid.resource_group_name.result
  location     = var.location
  tags         = local.tags
}

output "rg" {
  value = module.rg
}


################################################################################

module "nsg" {
  source              = "../security-group"
  resource_group_name = module.rg.name
  location            = var.location
  tags                = module.rg.tags

  security_rules = [
    {rule = "ssh"},
    {rule = "https"},
  ]

  default_rule = {
    source_address_prefix      = "Internet"
    destination_address_prefix = "VirtualNetwork"
  }
}

output "nsg" {
  value = module.nsg
}

################################################################################

module "src_nsa" {
  source              = "../app-security-group"
  resource_group_name = module.rg.name
  name                = "${module.rg.name}_src_nsa"
  location            = var.location
  tags                = module.rg.tags
}

output "src_nsa" {
  value = module.src_nsa
}

################################################################################

module "dst_nsa" {
  source              = "../app-security-group"
  resource_group_name = module.rg.name
  name                = "${module.rg.name}_dst_nsa"
  location            = var.location
  tags                = module.rg.tags
}

output "dst_nsa" {
  value = module.dst_nsa
}

################################################################################

module "nsr" {
  source                      = "../security-rule"
  resource_group_name         = module.rg.name
  network_security_group_name = module.nsg.name
  priority_offset             = module.nsg.priority_offset

  security_rules = [
    {
      description                = "Allow inbound traffic"
      protocol                   = "*"
    },
  ]

  default_rule = {
    # TODO: The following error occures when *_application_security_group_ids
    # are used (the second shot runs successfully, it happens only on
    # multi-resource with count.index used in expressions, may be related to
    # https://github.com/hashicorp/terraform/issues/19900):
    #
    # Error: Provider produced inconsistent final plan
    #
    # When expanding the plan for module.nsr.azurerm_network_security_rule.nsr[0] to
    # include new values learned so far during apply, provider "azurerm" produced an
    # invalid new value for .source_application_security_group_ids: was null, but
    # now cty.SetVal([]interface
    # {}{"/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXX/resourceGroups/e4c08cf8-0227-5751-489c-6098fc85c0e6/providers/Microsoft.Network/applicationSecurityGroups/e4c08cf8-0227-5751-489c-6098fc85c0e6_src_nsa"}).
    #
    # This is a bug in the provider, which should be reported in the provider's own
    # issue tracker.
    #
    source_application_security_group_ids = module.src_nsa.id
    destination_application_security_group_ids = module.dst_nsa.id
  }
}

output "nsr" {
  value = module.nsr
}

################################################################################

module "rt" {
  source              = "../route-table"
  resource_group_name = module.rg.name
  location            = var.location
  tags                = module.rg.tags

  routes = [
    {
      address_prefix         = "10.3.0.0/24"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.1.0.3"
    },
  ]
}

output "rt" {
  value = module.rt
}

################################################################################

module "route" {
  source              = "../route"
  resource_group_name = module.rg.name
  route_table_name    = module.rt.name

  routes = [
    {
      address_prefix         = "10.4.0.0/24"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.1.0.4"
    },
  ]
}

output "route" {
  value = module.route
}

################################################################################

module "vnet" {
  source              = "../"
  resource_group_name = module.rg.name
  location            = var.location
  tags                = module.rg.tags
  address_space       = "10.1.0.0/16,10.2.0.0/16"
  dns_servers         = "10.1.1.1,10.2.1.1"

  subnets = [
    {
      name           = "frontend"
      address_prefix = "10.1.1.0/24"
    },{
      address_prefix = "10.2.1.0/24"
      service_endpoints = "Microsoft.KeyVault,Microsoft.Storage"
    },
  ]

  # TODO: The error in Terraform 0.12 requires the following arguments to be
  # always defined even if the subnets = null. May be related to
  # https://github.com/hashicorp/terraform/issues/19900
  network_security_group_id = module.nsg.id
  route_table_id            = module.rt.id
}

output "vnet" {
  value = module.vnet
}

################################################################################

module "subnet" {
  source               = "../subnet"
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name

  subnets = [
    {
      address_prefix = "10.1.2.0/24"
    },{
      address_prefix = "10.2.2.0/24"
      service_endpoints = "Microsoft.KeyVault,Microsoft.Storage"
    },
  ]

  # TODO: The error in Terraform 0.12 requires the following arguments to be
  # always defined. May be related to
  # https://github.com/hashicorp/terraform/issues/19900
  network_security_group_id = module.nsg.id
  route_table_id            = module.rt.id
}

output "subnet" {
  value = module.subnet
}

################################################################################
