variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "name" {
  description = "Name of the launch config"
  default = ""
}

variable "lc_ami_id" {
  description = "Name of the ami id to be used by launch config"
  default = ""
}

variable "lc_instance_type" {
  description = "Instance type for launch config"
  default = ""
}

variable "lc_key_name" {
  description = "Key to be used for launch config"
  default = ""
}

variable "lc_security_group" {
  description = "Name of the of the lc security group"
  default = ""
}
