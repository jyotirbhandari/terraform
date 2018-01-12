variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "name" {
  description = "Name of the asg config"
  default = ""
}

variable "asg_name" {
  description = ""
  default = ""
}

variable "min_schedule_size" {
  description = ""
  default = ""
}

variable "max_schedule_size" {
  description = ""
  default = ""
}

variable "desired_schedule_size" {
  description = ""
  default = ""
}

variable "recurrence" {
  description = ""
  default = ""
}
