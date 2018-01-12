resource "aws_security_group" "natsg" {
  name = "vpc_nat"
  description = "Allow traffic to pass from the private subnet to the internet"

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.office_ip_address}"]
    //cidr_blocks = ["${var.office_ip_address}", "${var.private_subnets_cidr_block}"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.private_subnets_cidr_block}"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${var.private_subnets_cidr_block}"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    // cidr_blocks = ["${var.office_ip_address}"]
    cidr_blocks = ["${var.office_ip_address}", "${var.private_subnets_cidr_block}"]
  }
  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    // cidr_blocks = ["${var.private_subnets_cidr_block}"]
    cidr_blocks = ["${var.office_ip_address}", "${var.private_subnets_cidr_block}"]
  }
  ingress {
    from_port = 9999
    to_port = 9999
    protocol = "tcp"
    cidr_blocks = ["${var.office_ip_address}", "${var.private_subnets_cidr_block}"]
  }
  ingress {
    from_port = 9998
    to_port = 9998
    protocol = "tcp"
    cidr_blocks = ["${var.office_ip_address}", "${var.private_subnets_cidr_block}"]
  }

  egress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    // cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["${var.vpc_cidr}"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    // cidr_blocks = ["${var.vpc_cidr}"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    // cidr_blocks = ["${var.vpc_cidr}"]
    cidr_blocks = ["0.0.0.0/0"]
  }


  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.env}-natsg"
  }
}
