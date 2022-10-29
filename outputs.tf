locals {
  separtor_length            = length(var.separator)
  calculated_checksum_length = floor(var.max_length / 4)
  checksum_length = coalesce(var.checksum_length,
    local.calculated_checksum_length < 4 ? 4 :
    local.calculated_checksum_length > 12 ? 12 :
    local.calculated_checksum_length
  )
  prefix_length = var.max_length - local.separtor_length - local.checksum_length
}

output "result" {
  value = length(var.value) > var.max_length ? format("%s%s%s",
    substr(var.value, 0, local.prefix_length),
    var.separator,
    substr(sha1(var.value), 0, local.checksum_length)
  ) : var.value
}
