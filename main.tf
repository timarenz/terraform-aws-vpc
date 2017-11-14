resource "aws_vpc" "default" {
  cidr_block            = "192.168.0.0/16"
  enable_dns_hostnames  = true
  tags {
    Name  = "${var.owner_name}-${var.environment_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = true

  tags {
    Name  = "${var.owner_name}-${var.environment_name}-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "192.168.2.0/24"
  availability_zone = "${aws_subnet.public.availability_zone}"

  tags {
    Name  = "${var.owner_name}-${var.environment_name}-private"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name  = "${var.owner_name}-${var.environment_name}-igw"
  }
}

resource "aws_route" "internet_access" {
  route_table_id          = "${aws_vpc.default.main_route_table_id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.default.id}"
}