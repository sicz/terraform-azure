resource "random_uuid" "unique" {
  keepers = {
    keep = true
  }
}

locals {
  length             = var.length == null ? var.max_length : min(var.length, var.max_length)
  delimiter          = var.delimiter == null ? "" : var.delimiter
  hyphen_allowed     = var.delimiter == "-" ? true : var.hyphen_allowed
  period_allowed     = var.delimiter == "." ? true : var.period_allowed
  underscore_allowed = var.delimiter == "_" ? true : var.underscore_allowed

  unique    = (
    var.unique ||
    var.name == null && var.environment == null && var.location == null && var.role == null && var.instance == null
  )

  name1 = replace(
    join(local.delimiter,
      compact([
        var.name == null ? "" : replace(var.name, "/[^a-zA-Z0-9]+$/", ""),
        var.environment == null ? "" : replace(var.environment, "/[^a-zA-Z0-9]+$/", ""),
        var.location == null ? "" : replace(var.location, "/[^a-zA-Z0-9]+$/", ""),
        var.role == null ? "" : replace(var.role, "/[^a-zA-Z0-9]+$/", ""),
        var.instance == null ? "" : replace(var.instance, "/[^a-zA-Z0-9]+$/", ""),
        local.unique ? random_uuid.unique.result : ""
      ])
    ),
    "/[^\\w\\d._-]/", local.delimiter
  )

  name2 = local.hyphen_allowed ? local.name1 : replace(local.name1, "/-/", local.delimiter)
  name3 = local.period_allowed ? local.name2 : replace(local.name2, "/\\./", local.delimiter)
  name4 = local.underscore_allowed ? local.name3 : replace(local.name3, "/_/", local.delimiter)
  name5 = var.uppercase ? upper(local.name4) : local.name4
  name6 = var.lowercase ? lower(local.name5) : local.name5
  name7 = substr(local.name6, 0, local.length)
  name  = replace(local.name7, "/[^a-zA-Z0-9]+$/", "")
}
