// Output value of VPC id
output "vpc_id" {
  value = "${aws_vpc.initiate.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.initiate.cidr_block}"
}

output "vpc_main_route_table" {
  value = "${aws_vpc.initiate.main_route_table_id}"
}
