variable "vpc_cidr" {
  description = "VPC cidr block for environment"
  default = ""
}

variable "env" {
  description = "Name of the environment"
  default = ""
}

variable "tags" {
  type    = map(string)
  default = null
}
