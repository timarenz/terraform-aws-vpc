output "private_subnet_id" {
    value = "${aws_subnet.private.id}"
}

output "private_subnet_name" {
    value = "${aws_subnet.private.tags.Name}"
}

output "private_subnet_az" {
    value = "${aws_subnet.private.availability_zone}"
}

output "public_subnet_id" {
    value = "${aws_subnet.public.id}"
}

output "public_subnet_name" {
    value = "${aws_subnet.public.tags.Name}"
}

output "public_subnet_az" {
    value = "${aws_subnet.public.availability_zone}"
}

output "vpc_id" {
    value = "${aws_vpc.default.id}"
}

output "vpc_name" {
    value = "${aws_vpc.default.tags.Name}"
}