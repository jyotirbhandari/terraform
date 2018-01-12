data "aws_availability_zones" "azs" {}

// Create public subnet in the VPC
resource "aws_subnet" "public" {
  vpc_id = "${var.vpc_id}"
  cidr_block  = "${var.vpc_public_subnets [count.index]}"
  count = "${length(var.vpc_public_subnets)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  tags {
    Name = "${var.env}-public-subnet"
    Environment = "${var.env}"
  }
}

// Create private subnet in the VPC
resource "aws_subnet" "private" {
  vpc_id = "${var.vpc_id}"
  cidr_block  = "${var.vpc_private_subnets [count.index]}"
  count = "${length(var.vpc_private_subnets)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  tags {
    Name = "${var.env}-private-subnet"
    Environment = "${var.env}"
  }
}

// Create database subnet in the VPC
resource "aws_subnet" "database" {
  vpc_id = "${var.vpc_id}"
  cidr_block  = "${var.vpc_database_subnets [count.index]}"
  count = "${length(var.vpc_database_subnets)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  tags {
    Name = "${var.env}-database-subnet"
    Environment = "${var.env}"
  }
}

// Mapping database subnet to db subnet group in the VPC
resource "aws_db_subnet_group" "database" {
  name = "${var.env}-db-subnet-group"
  subnet_ids = ["${aws_subnet.database.*.id}"]
  count = "${length(var.vpc_database_subnets) > 0 ? 1 : 0}"
}

// Create elasticache subnet in the VPC
resource "aws_subnet" "elasticache" {
  vpc_id = "${var.vpc_id}"
  cidr_block  = "${var.vpc_elasticache_subnets [count.index]}"
  count = "${length(var.vpc_elasticache_subnets)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  tags {
    Name = "${var.env}-elasticache-subnet"
    Environment = "${var.env}"
  }
}

// Mapping elasticache subnet to elasticache subnet group in the VPC
resource "aws_elasticache_subnet_group" "elasticache" {
  name = "${var.env}-elasticache-subnet-group"
  subnet_ids = ["${aws_subnet.elasticache.*.id}"]
  count = "${length(var.vpc_elasticache_subnets) > 0 ? 1 : 0}"
}

//resource "random_shuffle" "public" {
//  depends_on = ["aws_subnet.public"]
//  input = ["${aws_subnet.public.*.id}"]
//  result_count = 1
//}
//
//resource "random_shuffle" "private" {
//  depends_on = ["aws_subnet.private"]
//  input = ["${aws_subnet.private.*.id}"]
//  result_count = 1
//}
//
//resource "random_shuffle" "database" {
//  depends_on = ["aws_subnet.database"]
//  input = ["${aws_subnet.database.*.id}"]
//  result_count = 1
//}
//
//resource "random_shuffle" "elasticache" {
//  depends_on = ["aws_subnet.elasticache"]
//  input = ["${aws_subnet.elasticache.*.id}"]
//  result_count = 1
//
//}


// Create internet gateway for public subnet
resource "aws_internet_gateway" "int_gw" {
  vpc_id = "${var.vpc_id}"
}

// Create route to internet via default table
resource "aws_route" "internet" {
  route_table_id = "${var.vpc_main_route_table}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.int_gw.id}"
}

// Associating subnets to public route table
resource "aws_route_table_association" "public" {
  count = "${length(var.vpc_public_subnets)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${var.vpc_main_route_table}"
}

// Create route table for private subnets
resource "aws_route_table" "private" {
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${var.nat_id}"
    gateway_id = "${var.gw_id}"
  }

  tags {
    Name = "${var.env}-private-subnet-route"
  }
}

// Associating subnets to webserber route table
resource "aws_route_table_association" "private" {
  count = "${length(var.vpc_private_subnets)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "database" {
  count = "${length(var.vpc_database_subnets)}"
  subnet_id      = "${element(aws_subnet.database.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "elasticache" {
  count = "${length(var.vpc_elasticache_subnets)}"
  subnet_id      = "${element(aws_subnet.elasticache.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}
