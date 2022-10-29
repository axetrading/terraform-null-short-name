locals {
  ten_chars = "0123456789"
  one_hundred_chars = format("%s%s%s%s%s%s%s%s%s%s",
    local.ten_chars, local.ten_chars, local.ten_chars, local.ten_chars, local.ten_chars,
    local.ten_chars, local.ten_chars, local.ten_chars, local.ten_chars, local.ten_chars,
  )
}

module "not_transformed" {
  source     = "../"
  value      = local.ten_chars
  max_length = 10
}

output "not_transformed" {
  value = module.not_transformed.result
}

module "defaults" {
  source     = "../"
  value      = local.one_hundred_chars
  max_length = 16
}

output "defaults" {
  value = module.defaults.result
}

module "defaults_15" {
  source     = "../"
  value      = local.one_hundred_chars
  max_length = 15
}

output "defaults_15" {
  value = module.defaults_15.result
}

module "defaults_19" {
  source     = "../"
  value      = local.one_hundred_chars
  max_length = 19
}

output "defaults_19" {
  value = module.defaults_19.result
}

module "defaults_20" {
  source     = "../"
  value      = local.one_hundred_chars
  max_length = 20
}

output "defaults_20" {
  value = module.defaults_20.result
}

module "defaults_52" {
  source     = "../"
  value      = local.one_hundred_chars
  max_length = 52
}

output "defaults_52" {
  value = module.defaults_52.result
}
