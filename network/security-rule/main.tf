resource "azurerm_network_security_rule" "nsr" {
  count                       = length(local.security_rules)
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name

  priority = lookup(var.security_rules[count.index], "priority",
    var.priority_offset + count.index
  )

  name = join("_", [
    lookup(local.security_rules[count.index], "name"),
    lookup(var.security_rules[count.index], "priority", var.priority_offset + count.index),
  ])

  description = local.security_rules[count.index].description
  access      = local.security_rules[count.index].access
  direction   = local.security_rules[count.index].direction
  protocol    = local.security_rules[count.index].protocol

  source_port_ranges                         = local.security_rules[count.index].source_port_ranges
  source_address_prefix                      = local.security_rules[count.index].source_address_prefix
  # TODO: Bug in terraform cause conflict between destination_address_prefix and
  # destination_address_prefixes
  # https://github.com/hashicorp/terraform/issues/19900
  # source_address_prefixes                    = local.security_rules[count.index].source_address_prefixes
  source_application_security_group_ids      = local.security_rules[count.index].source_application_security_group_ids

  destination_port_ranges                    = local.security_rules[count.index].destination_port_ranges
  destination_address_prefix                 = local.security_rules[count.index].destination_address_prefix
  # TODO: Bug in terraform cause conflict between destination_address_prefix and
  # destination_address_prefixes
  # https://github.com/hashicorp/terraform/issues/19900
  # destination_address_prefixes               = local.security_rules[count.index].destination_address_prefixes
  destination_application_security_group_ids = local.security_rules[count.index].destination_application_security_group_ids
}
