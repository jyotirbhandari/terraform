// Output value for the nat instance security group
output "vpc_mongodbsg" {
  value = "${aws_security_group.mongodbsg.id}"
}
