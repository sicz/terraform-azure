variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure Resource Group location"
  default     = "eastus"
  type        = string
}

variable "tags" {
  description = "Azure Resource Group tags"
  default     = null
  type        = map(string)
}
