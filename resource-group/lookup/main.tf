data "external" "azurerm_resource_group_tags" {
  program = [
    "bash",
    "-c",
    "(az group show --name '${var.name}' || echo '{}') | jq '.tags // {}'",
  ]
}
