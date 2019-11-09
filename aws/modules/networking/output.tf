// Output value of all the subnets in public subnets
output "public_subnets" {
  value = ["${aws_subnet.public.*.id}"]
}

// Output value of all the subnets in private subnets
output "private_subnets" {
  value = ["${aws_subnet.private.*.id}"]
}

// Output value of all the subnets in database subnets
output "database_subnets" {
  value = ["${aws_subnet.database.*.id}"]
}

// Output value of db subnet group
output "database_subnet_group" {
  //value = "${aws_db_subnet_group.database.id}"
  value = "${aws_db_subnet_group.database.*.id}"
}

output "database_subnet_group_name" {
  value = "${aws_db_subnet_group.database.*.name}"
}
// Output value of all the subnets in elasticache subnets
output "elasticache_subnets" {
  value = ["${aws_subnet.elasticache.*.id}"]
}

// Output value of elasticache subnet group
output "elasticache_subnet_group" {
  value = "${aws_elasticache_subnet_group.elasticache.*.id}"
}

output "elasticache_subnet_group_name" {
  value = "${aws_elasticache_subnet_group.elasticache.*.name}"
}
// Output value of all the subnets in private subnets
output "public_subnets_cidr_block" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}

output "private_subnets_cidr_block" {
  value = ["${aws_subnet.private.*.cidr_block}"]
}

//output "random_public_subnets" {
//  value = "${random_shuffle.public.result[0]}"
//}
//
//output "random_private_subnets" {
//  value = "${random_shuffle.private.result[0]}"
//}
//
//output "random_database_subnets" {
//  value = "${random_shuffle.database.result[0]}"
//}
//
//output "random_elasticache_subnets" {
//  value = "${random_shuffle.public.result[0]}"
//}

output "internet_gw" {
 value = "${aws_internet_gateway.int_gw.id}"
}
