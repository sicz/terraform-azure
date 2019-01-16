variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "name" {
  description = "Azure Route Table name. If not defined, defaults to Azure Resource Group name with '_route_table' suffix"
  type        = string
  default     = null
}

variable "location" {
  description = "Azure Route Table location"
  type        = string
}

variable "routes" {
  description = "Azure Routes"
  type        = list(map(string))
  default     = null
}

variable "disable_bgp_route_propagation" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table"
  type        = bool
  default     = null
}

variable "tags" {
  description = "Azure Route Table tags"
  type        = map(string)
  default     = null
}
