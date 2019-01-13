locals {
  # Default Securty Rule
  default_rule = merge({
    name                       = "rule"
    access                     = "Allow"
    direction                  = "Inbound"
    protocol                   = "Tcp"
    source_port_ranges         = "*"
    source_address_prefix      = "*"
    destination_port_ranges    = "*"
    destination_address_prefix = "*"
  }, var.default_rule == null ? {} : var.default_rule)

  # Security Rule Templates
  rule_templates = merge(
    local.app_rule_templates,
    local.protocol_rule_templates,
    local.microsoft_rule_templates,
    var.rule_templates == null ? {} : var.rule_templates,
    {
      default = {
        name                                       = lookup(local.default_rule, "name", null)
        access                                     = lookup(local.default_rule, "access", null)
        direction                                  = lookup(local.default_rule, "direction", null)
        protocol                                   = lookup(local.default_rule, "protocol", null)

        source_port_ranges                         = lookup(local.default_rule, "source_port_ranges", null)
        source_address_prefix                      = (
          lookup(local.default_rule, "source_address_prefixes", null) == null &&
          lookup(local.default_rule, "source_application_security_group_ids", null) == null ?
            lookup(local.default_rule, "source_address_prefix", null) :
            null
        )
        source_address_prefixes                    = lookup(local.default_rule, "source_address_prefixes", null)
        source_application_security_group_ids      = lookup(local.default_rule, "source_application_security_group_ids", null)

        destination_port_ranges                    = lookup(local.default_rule, "destination_port_ranges", null)
        destination_address_prefix                 = (
          lookup(local.default_rule, "destination_address_prefixes", null) == null &&
          lookup(local.default_rule, "destination_application_security_group_ids", null) == null ?
            lookup(local.default_rule, "destination_address_prefix", null) :
            null
        )
        destination_address_prefixes               = lookup(local.default_rule, "destination_address_prefixes", null)
        destination_application_security_group_ids = lookup(local.default_rule, "destination_application_security_group_ids", null)
      }
    }
  )

  # Security Rule Templates look up tables
  template_name                                       = {for rule,template in local.rule_templates: rule => lookup(template, "name", rule == "default" ? "rule" : rule)}
  template_description                                = {for rule,template in local.rule_templates: rule => lookup(template, "description", null)}
  template_access                                     = {for rule,template in local.rule_templates: rule => lookup(template, "acces", local.rule_templates.default.access)}
  template_direction                                  = {for rule,template in local.rule_templates: rule => lookup(template, "direction", local.rule_templates.default.direction)}
  template_protocol                                   = {for rule,template in local.rule_templates: rule => lookup(template, "protocol", local.rule_templates.default.protocol)}
  template_source_port_ranges                         = {for rule,template in local.rule_templates: rule => lookup(template, "source_port_ranges", local.rule_templates.default.source_port_ranges)}
  template_source_address_prefix                      = {for rule,template in local.rule_templates: rule => lookup(template, "source_address_prefix", local.rule_templates.default.source_address_prefix)}
  template_source_address_prefixes                    = {for rule,template in local.rule_templates: rule => lookup(template, "source_address_prefixes", local.rule_templates.default.source_address_prefixes)}
  template_source_application_security_group_ids      = {for rule,template in local.rule_templates: rule => lookup(template, "source_application_security_group_ids", local.rule_templates.default.source_application_security_group_ids)}
  template_destination_port_ranges                    = {for rule,template in local.rule_templates: rule => lookup(template, "destination_port_ranges", local.rule_templates.default.destination_port_ranges)}
  template_destination_address_prefix                 = {for rule,template in local.rule_templates: rule => lookup(template, "destination_address_prefix", local.rule_templates.default.destination_address_prefix)}
  template_destination_address_prefixes               = {for rule,template in local.rule_templates: rule => lookup(template, "destination_address_prefixes", local.rule_templates.default.destination_address_prefixes)}
  template_destination_application_security_group_ids = {for rule,template in local.rule_templates: rule => lookup(template, "destination_application_security_group_ids", local.rule_templates.default.destination_application_security_group_ids)}
}
