// Output value for the nat instance security group
output "vpc_natsg" {
  value = "${aws_security_group.natsg.id}"
}
