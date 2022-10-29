variable "value" {
  type = string
}

variable "max_length" {
  type = number
}

variable "checksum_length" {
  type    = number
  default = null
}

variable "separator" {
  type    = string
  default = "-"
}
