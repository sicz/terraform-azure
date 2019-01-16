################################################################################

module "default_name" {
  source       = "../"
}

output "default_name" {
  value = module.default_name
}

################################################################################

module "full_name" {
  source       = "../"
  name = "rg%x_x-y.z"
  role = "dev"
  instance = 1
  instance_format = "%03d"
  separator = ":"
  uppercase = true
  lowercase = true
  unique = true
  length = 28
}

output "full_name" {
  value = module.full_name
}

################################################################################
