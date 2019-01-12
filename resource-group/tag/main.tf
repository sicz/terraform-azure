data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "null_resource" "azurerm_resource_group_tag" {
  triggers = {
    tag = "${var.name}=${var.value}"
  }

  provisioner "local-exec" {
    command     = "az group update --name '${var.resource_group_name}' --set 'tags.${var.name}=${var.value}'"
    interpreter = ["/bin/bash", "-c"]
  }

  provisioner "local-exec" {
    when        = "destroy"
    command     = "az group update --name '${var.resource_group_name}' --remove 'tags.${var.name}'"
    interpreter = ["bash", "-c"]
  }
}
