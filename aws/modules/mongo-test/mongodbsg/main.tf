resource "aws_security_group" "mongodbsg" {
  name = "vpc_mongodb"
  description = "Allow traffic to pass to mongodb"

  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    // cidr_blocks = ["0.0.0.0/0"]
    // cidr_blocks = ["${var.private_subnets_cidr_block}"]
    cidr_blocks = ["${var.private_subnets_cidr_block}", "${var.office_ip_address}", "${var.nat_private_ip}/32"]

  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    // cidr_blocks = ["${var.nat_private_ip}/32"]
    cidr_blocks = ["${var.private_subnets_cidr_block}", "${var.office_ip_address}", "${var.nat_private_ip}/32"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    // cidr_blocks = ["${var.nat_private_ip}/32"]
    cidr_blocks = ["${var.private_subnets_cidr_block}", "${var.office_ip_address}", "${var.nat_private_ip}/32"]
  }

  egress {
    from_port = 0
    to_port = 0 
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.env}-mongodbsg"
  }
}
