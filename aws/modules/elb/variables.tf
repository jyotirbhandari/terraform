variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "name" {
  description = "Name of the of the alb"
  default = ""
}

variable "elb_subnets" {
  description = "Subnets associated with alb"
  type = "list"
  default = []
}

variable "elb_security_group" {
  description = "Name of the of the alb security group"
  default = ""
}

variable "elb_backend_port" {
  description = "Name of the of the alb backend port"
  default = ""
}

variable "elb_backend_protocol" {
  description = "Name of the of the alb backend protocol"
  default = ""
}

variable "health_check_interval" {
  description = "Health check interval"
  default = ""
}

variable "health_check_path" {
  description = "Health check path"
  default = ""
}

variable "health_check_h_threshold" {
  description = "Health check heathy threshold"
  default = ""
}

variable "health_check_u_threshold" {
  description = "Health check unheathy threshold"
  default = ""
}

variable "health_check_timeout" {
  description = "Health check timeout"
  default = ""
}

variable "cookie_duration" {
  description = "Stickness cookie duration"
  default = ""
}

variable "lb_http_port" {
  description = "Listner http port"
  default = ""
}

variable "lb_http_protocol" {
  description = "Listner http protocol"
  default = ""
}

variable "lb_https_port" {
  description = "Listner https port"
  default = ""
}

variable "lb_https_protocol" {
  description = "Listner https protocol"
  default = ""
}

variable "certificate_arn" {
  description = "SSL certificate arn"
  default = ""
}

variable "elb_idle_timeout" {
  description = "Idle timecout for connection"
  default = ""
}
