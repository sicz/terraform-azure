variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "name" {
  description = "Azure Virtual Network name. If not defined, defaults to Azure Resource Group name with '_vnet' suffix"
  type        = string
  default     = null
}

variable "location" {
  description = "Azure Virtual Network location"
  type        = string
}

variable "address_space" {
  description = "Azure Virtual Network address space"
  type        = string
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = string
  default     = null
}

variable "subnets" {
  description = "Azure Network Subnets"
  type        = list(map(string))
  default     = null
}

variable "network_security_group_id" {
  description = "Azure Network Security Group id, to which the subnets will be assicated"
  type        = string
  default     = null
}

variable "route_table_id" {
  description = "Azure Route Table id, to which the subnets will be assicated"
  type        = string
  default     = null
}

variable "tags" {
  description = "Azure Virtual Network tags"
  type        = map(string)
  default     = null
}
