data "azurerm_resource_group" "rg" {
  name = var.name
}

locals {
  tag   = keys(var.tags)
  value = values(var.tags)
}

resource "null_resource" "azurerm_resource_group_tag" {
  count = length(local.tag)

  triggers = {
    tag = "${local.tag[count.index]}=${local.value[count.index]}"
  }

  provisioner "local-exec" {
    command     = "az group update --name '${var.name}' --set 'tags.${local.tag[count.index]}=${local.value[count.index]}' | jq '.tags'"
    interpreter = ["/bin/bash", "-c"]
  }

  provisioner "local-exec" {
    when        = "destroy"
    command     = "az group update --name '${var.name}' --remove 'tags.${local.tag[count.index]}' | jq '.tags'"
    interpreter = ["bash", "-c"]
  }
}
