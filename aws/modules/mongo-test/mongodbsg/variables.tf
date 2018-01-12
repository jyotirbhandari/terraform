variable "vpc_id" {
  description = "VPC id for the environment"
  default = ""
}

variable "env" {
  description = "Name of the  respetive environment"
  default = ""
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = ""
}

variable "nat_private_ip" {
  description = "Nat instance private ip"
  default = ""
}

variable "private_subnets_cidr_block" {
  description = "List of cidr block in private subnets"
  type = "list"
  default = []
}

variable "office_ip_address" {
  description = "Office ip address to access nat instance and other internal instances"
  type = "list"
  default = []
}
