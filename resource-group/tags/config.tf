variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "tags" {
  description = "Azure Resource Group tags"
  default     = null
  type        = map(string)
}

variable "module_debug" {
  description = "Output managed resources"
  type        = bool
  default     = false
}
