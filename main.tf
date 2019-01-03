data "aws_region" "current" {}

locals {
  default_vpc_tags = {
    Name = "${var.environment_name}-vpc"
  }

  default_public_subnet_tags = {
    Name = "${var.environment_name}-public"
  }

  default_private_subnet_tags = {
    Name = "${var.environment_name}-private"
  }
}

resource "aws_vpc" "default" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = "${merge(local.default_vpc_tags, var.vpc_tags)}"
}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true

  tags = "${merge(local.default_public_subnet_tags, var.public_subnet_tags)}"
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "192.168.2.0/24"
  availability_zone = "${aws_subnet.public.availability_zone}"

  tags = "${merge(local.default_private_subnet_tags, var.private_subnet_tags)}"
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.environment_name}-igw"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.default.id}"
}
