data "azurerm_resource_group" "rg" {
  name = var.name
}

locals {
  tags   = keys(var.tags)
  values = values(var.tags)
}

# TODO: Use Terraform 0.12 for_each instead of count
resource "null_resource" "azurerm_resource_group_tag" {
  count = length(local.tags)

  triggers = {
    tag = "${local.tags[count.index]}=${local.values[count.index]}"
  }

  provisioner "local-exec" {
    command     = "az group update --name '${var.name}' --set 'tags.${local.tags[count.index]}=${local.values[count.index]}' | jq '.tags'"
    interpreter = ["/bin/bash", "-c"]
  }

  provisioner "local-exec" {
    when        = "destroy"
    command     = "az group update --name '${var.name}' --remove 'tags.${local.tags[count.index]}' | jq '.tags'"
    interpreter = ["bash", "-c"]
  }
}
