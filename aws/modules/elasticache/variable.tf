variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "name" {
  description = "Name of the elasticache"
  default = ""
}

variable "elasticache_family" {
  description = "Family name to be used for parameter group"
  default = ""
}

variable "elasticache_engine" {
  description = "engine to be used redis/memcache"
  default = ""
}

variable "elasticache_node_type" {
  description = "instance type to be used"
  default = ""
}

variable "elasticache_nodes_num" {
  description = "number of nodes in the cluster"
  default = ""
}

variable "elasticache_port" {
  description = "port to be used for elasticache memcache/redis"
  default = ""
}

variable "elasticache_subnet_group" {
  description = "subnet group to be used for elasticache memcache/redis"
  default = ""
}

variable "elasticache_security_groups" {
  description = "secrity groups to be used for elasticache memcache/redis"
  default = ""
}
