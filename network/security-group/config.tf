variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "name" {
  description = "Azure Network Security Group name. If not defined, defaults to Azure Resource Group name wit _nsg suffix"
  type        = string
  default     = null
}

variable "location" {
  description = "Azure Network Security Group location"
  type        = string
}

variable "priority_offset" {
  description = "Azure Network Security Rules priority offset"
  type        = number
  default     = 100
}

variable "security_rules" {
  description = "Azure Network Security Rules"
  type        = list(map(string))
  default     = null
}

variable "default_rule" {
  description = "Default Azure Network Security Rule"
  type        = map(string)
  default     = null
}

variable "tags" {
  description = "Azure Network Security Group tags"
  type        = map(string)
  default     = null
}
