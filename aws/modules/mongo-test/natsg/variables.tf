variable "vpc_id" {
  description = "VPC id for the environment"
  default = ""
}

variable "vpc_cidr" {
  description = "VPC cidr block for environment"
  default = ""
}

variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-east-1"
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
