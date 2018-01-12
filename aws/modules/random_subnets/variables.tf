variable "public_subnets" {
  description = "List of public subnets"
  type = "list"
  default = []
}

variable "private_subnets" {
  description = "List of private subnets"
  type = "list"
  default = []
}

variable "database_subnets" {
  description = "List of database subnets"
  type = "list"
  default = []
}


variable "elasticache_subnets" {
  description = "List of elasticache subnets"
  type = "list"
  default = []
}
