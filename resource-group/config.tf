variable "name" {
  description = "Azure Resource Group name"
}

variable "location" {
  description = "Azure Resource Group location"
  default     = "eastus"
}

variable "tags" {
  description = "Azure Resource Group tags"
  type        = "map"
  default     = {}
}
