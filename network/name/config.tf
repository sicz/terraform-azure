variable "name" {
  description = "Identifies the product, application, or service that the resource supports"
  type        = string
  default     = null
}

variable "environment" {
  description = "Identifies the environment of the associated resource"
  type        = string
  default     = null
}

variable "location" {
  description = "Identifies the location of the associated resource"
  type        = string
  default     = null
}

variable "role" {
  description = "Identifies the role of the associated resource"
  type        = string
  default     = "vnet"
}

variable "instance" {
  description = "Identifies the instance number of the associated resource"
  type        = number
  default     = null
}

variable "unique" {
  description = "Name should be unique"
  type        = bool
  default     = false
}

variable "delimiter" {
  description = "Name parts delimiter"
  type        = string
  default     = "_"
}

variable "length" {
  description = "Maximum name length"
  type        = number
  default     = 64
}

variable "hyphen_allowed" {
  description = "Name can containt hyphens"
  type        = bool
  default     = false
}

variable "period_allowed" {
  description = "Name can containt periods"
  type        = bool
  default     = false
}

variable "underscore_allowed" {
  description = "Name can containt underscores"
  type        = bool
  default     = false
}

variable "lowercase" {
  description = "Name should contain only lowercase caracters"
  type        = bool
  default     = false
}

variable "uppercase" {
  description = "Name should contain only uppercase caracters"
  type        = bool
  default     = false
}
