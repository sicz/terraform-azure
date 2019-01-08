variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "tags" {
  description = "Azure Resource Group tags"
  default     = null
  type        = map(string)
}
