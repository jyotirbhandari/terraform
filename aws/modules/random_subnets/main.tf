resource "random_shuffle" "public" {
  input = ["${var.public_subnets}"]
  result_count = 1
}

resource "random_shuffle" "private" {
  input = ["${var.private_subnets}"]
  result_count = 1
}

resource "random_shuffle" "database" {
  input = ["${var.database_subnets}"]
  result_count = 1
}

resource "random_shuffle" "elasticache" {
  input = ["${var.elasticache_subnets}"]
  result_count = 1
}
