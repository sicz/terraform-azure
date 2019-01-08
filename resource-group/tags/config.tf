variable "name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "tags" {
  description = "Azure Resource Group tags"
  type        = map(string)
}
