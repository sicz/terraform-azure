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
  type        = map(string)
  default     = null
}
