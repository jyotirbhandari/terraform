variable "env" {
  description = "Name of the respetive environment"
  default = ""
}

variable "eb_app_name" {
  description = "Name to use for elasticbeanstalk app"
  default = ""
}

variable "eb_app_version_name" {
  description = "Name to use for elasticbeanstalk app version name"
  default = ""
}

variable "eb_env_name" {
  description = "Name to use for elasticbeanstalk environment"
  default = ""
}

variable "s3_bucket_id" {
  description = "S3 bucket to use for elasticbeanstalk app"
  default = ""
}

variable "s3_bucket_object_id" {
  description = "S3 bucket object to use for elasticbeanstalk app"
  default = ""
}

variable "eb_solution_stack_name" {
  description = "Solution stack to use for elasticbeanstalk app"
  default = ""
}

variable "eb_tier" {
  description = "tier to use for elasticbeanstalk app"
  default = ""
}

variable "vpc_id" {
  description = "VPC id for the elasticbeanstalk"
  default = ""
}

variable "elb_scheme" {
  description = "Scheme to be used for ELB"
  default = ""
}

variable "eb_subnets" {
  description = "Subnets to be used for EB"
  default = ""
}

variable "eb_elb_subnets" {
  description = "Subnets to be used for EB ELB"
  default = ""
}

variable "eb_apip" {
  description = "EB Associate ip address"
  default = ""
}

variable "eb_elb_cz" {
  description = "EB ELB cross zone boolean"
  default = ""
}

variable "elb_connection_draining" {
  description = "ELB connection draining boolean"
  default = ""
}

variable "instance_type" {
  description = "Instance type for elasticbeanstalk"
  default = ""
}

variable "instance_root_type" {
  description = "Instance root volume type for elasticbeanstalk"
  default = ""
}

variable "eb_iam_profile" {
  description = "EB IAM profile"
  default = ""
}

variable "eb_key_pair" {
  description = "EB key pair"
  default = ""
}

variable "eb_security_groups" {
  description = "Security group for elasticbeanstalk"
  default = ""
}
variable "asg_min_size" {
  description = "Autoscaling minimum size"
  default = ""
}

variable "asg_max_size" {
  description = "Autoscaling maximum size"
  default = ""
}

variable "asg_trigger_breach_duration" {
  description = "Autoscaling breach duration"
  default = ""
}

variable "asg_trigger_measure_name" {
  description = "Autoscaling measure name"
  default = ""
}

variable "asg_trigger_period" {
  description = "Autoscaling period"
  default = ""
}

variable "asg_trigger_statistic" {
  description = "Autoscaling Statistic to be used"
  default = ""
}

variable "asg_trigger_unit" {
  description = "Autoscaling measure unit"
  default = ""
}

variable "asg_trigger_lower_breach_scale_increment" {
  description = "Autoscaling lower breach value"
  default = ""
}

variable "asg_trigger_upper_breach_scale_increment" {
  description = "Autoscaling upper breach value"
  default = ""
}

variable "asg_trigger_lower_threshold" {
  description = "Autoscaling lower threshold value"
  default = ""
}

variable "asg_trigger_upper_threshold" {
  description = "Autoscaling upper threshold value"
  default = ""
}

variable "eb_env" {
  description = "Elasticbeanstalk environment"
  default = ""
}

variable "sqs_arn" {
  description = "SQS Arn value"
  default = ""
}

variable "sqs_path" {
  description = "SQS Arn value"
  default = ""
}

variable "sqs_mime" {
  description = "SQS Arn value"
  default = ""
}
