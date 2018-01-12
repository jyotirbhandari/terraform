variable "env" {
  description = "Name of the respective environment"
  default = ""
} 

variable "name" {
  description = "Name to be used"
  default = ""
} 

variable "perf_mode" {
  description = "gerneral purpose or maxIO"
  type = "string"
}

variable "efs_subnet_ids" {
  description = "Subnets for the efs"
  type = "string"
  default = ""
}

variable "efs_security_groups" {
  description = "Security group for efs"
  type = "list"
  default = []
}
