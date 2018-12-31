variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure Resource Group location"
  type        = string
}

variable "tags" {
  description = "Azure Resource Group tags"
  default     = null
  type        = map(string)
}

variable "module_debug" {
  description = "Output full resource properties"
  type        = bool
  default     = false
}
