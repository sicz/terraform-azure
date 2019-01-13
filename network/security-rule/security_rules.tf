locals {
  security_rules = [ for rule in var.security_rules: {
    name = lookup(rule, "name",
      lookup(local.template_name, lookup(rule, "rule", "default"), null)
    )

    description = lookup(rule, "description",
      lookup(local.template_description, lookup(rule, "rule", "default"), null)
    )

    access = lookup(rule, "access",
      lookup(local.template_access, lookup(rule, "rule", "default"), null)
    )

    direction = lookup(rule, "direction",
      lookup(local.template_direction, lookup(rule, "rule", "default"), null)
    )

    protocol = lookup(rule, "protocol",
      lookup(local.template_protocol, lookup(rule, "rule", "default"), null)
    )

    source_port_ranges = lookup(rule, "source_port_ranges",
      lookup(local.template_source_port_ranges, lookup(rule, "rule", "default"), null)
    ) == null ? null : compact(split(",", replace(
      lookup(rule, "source_port_ranges",
        lookup(local.template_source_port_ranges, lookup(rule, "rule", "default"))
      ),
      "*",
      "0-65535"
    )))

    source_address_prefix = lookup(rule, "source_address_prefix",
      lookup(rule, "source_address_prefixes", null) == null &&
      lookup(rule, "source_application_security_group_ids", null) == null ?
        lookup(local.template_source_address_prefix, lookup(rule, "rule", "default"), null) :
        null
    )

    source_address_prefixes = lookup(rule, "source_address_prefixes",
      lookup(rule, "source_address_prefix", null) == null &&
      lookup(rule, "source_application_security_group_ids", null) == null ?
        lookup(local.template_source_address_prefixes, lookup(rule, "rule", "default"), null) :
        null
    ) == null ? null : compact(split(",",
      lookup(rule, "source_address_prefixes",
        lookup(local.template_source_address_prefixes, lookup(rule, "rule", "default"))
      )
    ))

    source_application_security_group_ids = lookup(rule, "source_application_security_group_ids",
      lookup(rule, "source_address_prefix", null) == null &&
      lookup(rule, "source_address_prefixes", null) == null ?
        lookup(local.template_source_application_security_group_ids, lookup(rule, "rule", "default"), null) :
        null
    ) == null ? null : compact(split(",",
      lookup(rule, "source_application_security_group_ids",
        lookup(local.template_source_application_security_group_ids, lookup(rule, "rule", "default"))
      )
    ))

    destination_port_ranges = lookup(rule, "destination_port_ranges",
      lookup(local.template_destination_port_ranges, lookup(rule, "rule", "default"), null)
    ) == null ? null : compact(split(",", replace(
      lookup(rule, "destination_port_ranges",
        lookup(local.template_destination_port_ranges, lookup(rule, "rule", "default"))
      ),
      "*",
      "0-65535"
    )))

    destination_address_prefix = lookup(rule, "destination_address_prefix",
      lookup(rule, "destination_address_prefixes", null) == null &&
      lookup(rule, "destination_application_security_group_ids", null) == null ?
        lookup(local.template_destination_address_prefix, lookup(rule, "rule", "default"), null) :
        null
    )

    destination_address_prefixes = lookup(rule, "destination_address_prefixes",
      lookup(rule, "destination_address_prefix", null) == null &&
      lookup(rule, "destination_application_security_group_ids", null) == null ?
        lookup(local.template_destination_address_prefixes, lookup(rule, "rule", "default"), null) :
        null
    ) == null ? null : compact(split(",",
      lookup(rule, "destination_address_prefixes",
        lookup(local.template_destination_address_prefixes, lookup(rule, "rule", "default"))
      )
    ))

    destination_application_security_group_ids = lookup(rule, "destination_application_security_group_ids",
      lookup(rule, "destination_address_prefix", null) == null &&
      lookup(rule, "destination_address_prefixes", null) == null ?
        lookup(local.template_destination_application_security_group_ids, lookup(rule, "rule", "default"), null) :
        null
    ) == null ? null : compact(split(",",
      lookup(rule, "destination_application_security_group_ids",
        lookup(local.template_destination_application_security_group_ids, lookup(rule, "rule", "default"))
      )
    ))
  }]
}
