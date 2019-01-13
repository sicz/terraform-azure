variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "route_table_name" {
  description = "Azure Route Table name"
  type        = string
}

variable "routes" {
  description = "Azure Routes"
  type        = list(map(string))
}
