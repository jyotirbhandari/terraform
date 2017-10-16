provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "beanstalk" {
  bucket = "12Q8DC0JWUGQUZMD5CINVEJTUQZDMZSDRU"
}

resource "aws_s3_bucket_object" "beanstalk" {
  bucket = "${aws_s3_bucket.beanstalk.id}"
  key    = "beanstalk/web.zip"
  source = "web.zip"
}

module "elasticbeanstalk" {
  source = "../../modules/elasticbeanstalk"
  env = "dev"
  eb_app_name = "eb-app"
  eb_app_version_name = "eb-app-version"
  eb_env_name = "12Q8DC0JWUGQUZMD5CINVEJTUQZDMZSDRU"
  s3_bucket_id = "${aws_s3_bucket.beanstalk.id}"
  s3_bucket_object_id = "${aws_s3_bucket_object.beanstalk.id}"
  eb_solution_stack_name = "64bit Amazon Linux 2017.03 v2.5.0 running PHP 7.1"
  eb_tier = "WebServer"
}


