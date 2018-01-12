output "random_public_subnets" {
  value = "${random_shuffle.public.result[0]}"
}

output "random_private_subnets" {
  value = "${random_shuffle.private.result[0]}"
}

output "random_database_subnets" {
  value = "${random_shuffle.database.result[0]}"
}

output "random_elasticache_subnets" {
  value = "${random_shuffle.elasticache.result[0]}"
}
