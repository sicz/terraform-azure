variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "network_security_group_name" {
  description = "Azure Network Security Group name"
  type        = string
}

variable "priority_offset" {
  description = "Azure Network Security Rules priority offset"
  type        = number
}

variable "security_rules" {
  description = "Azure Network Security Rules"
  type        = list(map(string))
}

variable "rule_templates" {
  description = "Custom Azure Network Security Rule templates"
  type        = map(map(string))
  default     = null
}

variable "default_rule" {
  description = "Default Azure Network Security Rule"
  type        = map(string)
  default     = null
}
