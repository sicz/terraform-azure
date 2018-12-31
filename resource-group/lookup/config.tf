variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "module_debug" {
  description = "Output managed resources"
  type        = bool
  default     = false
}
