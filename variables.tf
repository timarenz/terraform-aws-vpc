variable "environment_name" {
  type = "string"
}

variable "vpc_tags" {
  type    = "map"
  default = {}
}

variable "public_subnet_tags" {
  type    = "map"
  default = {}
}

variable "private_subnet_tags" {
  type    = "map"
  default = {}
}
