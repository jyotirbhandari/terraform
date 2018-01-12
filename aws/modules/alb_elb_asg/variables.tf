variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "name" {
  description = "Name of the asg config"
  default = ""
}

variable "lc_id" {
  description = "ID of the launch config"
  default = ""
}

variable "asg_min_size" {
  description = "Min number of instances running in Autoscaling"
  default = ""
}

variable "asg_max_size" {
  description = "Max number of instances running in Autoscaling"
  default = ""
}

variable "asg_subnets" {
  description = "Private subnets for instances"
  type = "list"
  default = []
}

variable "load_balancer" {
  description = "List of elb to be attached to asg"
  default = ""
}

variable "target_group_arn" {
  description = "List of target arn to be attached to asg"
  default = ""
}

variable "health_check_grace_period" {
  description = ""
  default = ""
}

variable "health_check_type" {
  description = ""
  default = ""
}

variable "increase_cooldown" {
  description = ""
  default = ""
}

variable "decrease_cooldown" {
  description = ""
  default = ""
}

variable "increase_scaling_adj" {
  description = ""
  default = ""
}

variable "increase_adj_type" {
  description = ""
  default = ""
}

variable "decrease_scaling_adj" {
  description = ""
  default = ""
}

variable "decrease_adj_type" {
  description = ""
  default = ""
}

variable "increase_policy_type" {
  description = ""
  default = ""
}

variable "decrease_policy_type" {
  description = ""
  default = ""
}

variable "increase_metric_agg_type" {
  description = ""
  default = ""
}

variable "decrease_metric_agg_type" {
  description = ""
  default = ""
}

variable "increase_est_instance_warup" {
  description = ""
  default = ""
}

variable "decrease_est_instance_warup" {
  description = ""
  default = ""
}

variable "increase_metric_interval_lower" {
  description = ""
  default = ""
}

variable "decrease_metric_interval_lower" {
  description = ""
  default = ""
}
  
variable "increase_metric_interval_upper" {
  description = ""
  default = ""
}

variable "decrease_metric_interval_upper" {
  description = ""
  default = ""
}

variable "increase_scaling_simple_adj" {
  description = ""
  default = ""
}

variable "decrease_scaling_simple_adj" {
  description = ""
  default = ""
}

variable "increase_simple_cooldown" {
  description = ""
  default = ""
}

variable "decrease_simple_cooldown" {
  description = ""
  default = ""
}


variable "alm_increase_comparison_operator" {
  description = ""
  default = ""
}

variable "alm_increase_eval_period" {
  description = ""
  default = ""
}

variable "alm_increase_metric_name" {
  description = ""
  default = ""
}

variable "alm_increase_namespace" {
  description = ""
  default = ""
}

variable "alm_increase_period" {
  description = ""
  default = ""
}

variable "alm_increase_statistic" {
  description = ""
  default = ""
}

variable "alm_increase_threshold" {
  description = ""
  default = ""
}

variable "alm_decrease_comparison_operator" {
  description = ""
  default = ""
}

variable "alm_decrease_eval_period" {
  description = ""
  default = ""
}

variable "alm_decrease_metric_name" {
  description = ""
  default = ""
}

variable "alm_decrease_namespace" {
  description = ""
  default = ""
}

variable "alm_decrease_period" {
  description = ""
  default = ""
}

variable "alm_decrease_statistic" {
  description = ""
  default = ""
}

variable "alm_decrease_threshold" {
  description = ""
  default = ""
}

variable "asg_default_cooldown" {
  description = ""
  default = ""
}


