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
