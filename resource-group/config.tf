variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure Resource Group location"
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "Azure Resource Group tags"
  type        = map
  default     = {}
}
