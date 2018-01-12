output "elasticache_addr" {
  value = "${aws_elasticache_cluster.main.cache_nodes.0.address}"
}
