
output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "vpc_name" {
  value = "${aws_vpc.default.tags.Name}"
}

output "vpc_region" {
  value = "${data.aws_region.current.name}"
}

output "vpc_private_subnet_id" {
  value = "${aws_subnet.private.id}"
}

output "vpc_private_subnet_name" {
  value = "${aws_subnet.private.tags.Name}"
}

output "vpc_private_subnet_az" {
  value = "${aws_subnet.private.availability_zone}"
}

output "vpc_private_subnet_cidr" {
  value = "${aws_subnet.private.cidr_block}"
}

output "vpc_public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "vpc_public_subnet_name" {
  value = "${aws_subnet.public.tags.Name}"
}

output "vpc_public_subnet_az" {
  value = "${aws_subnet.public.availability_zone}"
}

output "vpc_public_subnet_cidr" {
  value = "${aws_subnet.public.cidr_block}"
}

