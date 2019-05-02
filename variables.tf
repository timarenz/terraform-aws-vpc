variable "environment_name" {
  type        = "string"
  description = "Used as prefix for all supported object names"
}

variable "vpc_tags" {
  type        = "map"
  description = "Additional tags required for the VPC object"
  default     = {}
}

variable "public_subnet_tags" {
  type        = "map"
  description = "Additional tags required for the public subnet object"
  default     = {}
}

variable "private_subnet_tags" {
  type        = "map"
  description = "Additional tags required for the private subnet object"
  default     = {}
}
