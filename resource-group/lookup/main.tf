data "external" "azurerm_resource_group_location" {
  program = [
    "bash",
    "-c",
    "(az group show --name '${var.name}' || echo '{}') | jq '{location: (.location)}'",
  ]
}

locals {
  _location = lookup(data.external.azurerm_resource_group_location.result, "location", "")
  location  = local._location != "" ? local._location : null
}

data "external" "azurerm_resource_group_tags" {
  program = [
    "bash",
    "-c",
    "(az group show --name '${var.name}' || echo '{}') | jq '.tags // {}'",
  ]
}
