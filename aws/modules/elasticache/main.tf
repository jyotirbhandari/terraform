

resource "aws_elasticache_parameter_group" "main" {
  name   = "${var.env}-${var.name}-ecache-param"
  family = "${var.elasticache_family}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elasticache_cluster" "main" {
  cluster_id = "${var.env}-${var.name}-ecache"
  engine = "${var.elasticache_engine}"
  node_type = "${var.elasticache_node_type}"
  num_cache_nodes = "${var.elasticache_nodes_num}"
  port = "${var.elasticache_port}"
  subnet_group_name = "${var.elasticache_subnet_group}"
  security_group_ids = ["${var.elasticache_security_groups}"]
  parameter_group_name = "${aws_elasticache_parameter_group.main.id}"
  lifecycle {
    create_before_destroy = true
  }
  tags  {
    Environment = "${var.env}"
  }
}
