variable "vpc_id" {
  description = "VPC cidr block for environment"
  default = ""
}

variable "vpc_main_route_table" {
  description = "VPC cidr block for environment"
  default = ""
}

variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = ""
}

variable "vpc_public_subnets" {
  description = "Public subnet for respective environment"
  type = "list"
  default = []
}

variable "vpc_private_subnets" {
  description = "Private subnet for respective environment"
  type = "list"
  default = []
}

variable "vpc_database_subnets" {
  description = "Database subnet for respective environment"
  type = "list"
  default = []
}

variable "vpc_elasticache_subnets" {
  description = "Elasticache subnet for respective environment"
  type = "list"
  default = []
}

variable "nat_id" {
  description = "Id of the NAT instance"
  default = ""
}

variable "gw_id" {
  description = "Id of the Gateway"
  default = ""
}

variable "tags_public" {
  description = "Tags for public subnets"
  type    = map(string)
  default = null
}

variable "tags_private" {
  description = "Tags for private subnets"
  type    = map(string)
  default = null
}

variable "tags_database" {
  description = "Tags for database subnets"
  type    = map(string)
  default = null
}

variable "tags_elasticache" {
  description = "Tags for elasticache subnets"
  type    = map(string)
  default = null
}

