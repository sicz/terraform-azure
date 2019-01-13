variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Azure Virtual Network name"
  type        = string
}

variable "subnets" {
  description = "Azure Network Subnets"
  type        = list(map(string))
}

variable "network_security_group_id" {
  description = "Azure Network Security Group id, to which the subnets will be assicated"
  type        = string
}

variable "route_table_id" {
  description = "Azure Route Table id, to which the subnets will be assicated"
  type        = string
}
