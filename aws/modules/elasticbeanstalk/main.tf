resource "aws_elastic_beanstalk_application" "main" {
  name  = "${var.eb_app_name}-${var.env}"
  description = "elasticbeanstalk application"
}

resource "aws_elastic_beanstalk_application_version" "main" {
  name = "${var.eb_app_version_name}-${var.env}"
  application = "${aws_elastic_beanstalk_application.main.name}"
  bucket  = "${var.s3_bucket_id}"
  key = "${var.s3_bucket_object_id}"
}

resource "aws_elastic_beanstalk_environment" "main" {
  depends_on = ["aws_elastic_beanstalk_application_version.main"]
  name  = "${var.eb_env_name}-${var.env}"
  application = "${aws_elastic_beanstalk_application.main.name}"
  version_label = "${aws_elastic_beanstalk_application_version.main.name}"
  solution_stack_name = "${var.eb_solution_stack_name}"
  tier = "${var.eb_tier}"
}
