variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "name" {
  description = "Azure Application Security Group name. If not defined, defaults to Azure Resource Group name wit _asg suffix"
  type        = string
  default     = null
}

variable "location" {
  description = "Azure Application Security Group location"
  type        = string
}

variable "tags" {
  description = "Azure Network Security Group tags"
  type        = map(string)
  default     = null
}
