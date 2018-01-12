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
  name  = "${var.eb_env_name}"
  application = "${aws_elastic_beanstalk_application.main.name}"
  version_label = "${aws_elastic_beanstalk_application_version.main.name}"
  solution_stack_name = "${var.eb_solution_stack_name}"
  tier = "${var.eb_tier}"

  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = "${var.vpc_id}"
  }
  
	setting {
    namespace = "aws:ec2:vpc"
    name = "ELBScheme"
    value = "${var.elb_scheme}"
  }
	
	setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "${var.eb_subnets}"
  }
  
	setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = "${var.eb_elb_subnets}"
  }
	
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "${var.eb_apip}"
  }

	setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "${var.eb_elb_cz}"
  }
 
	setting {
    namespace = "aws:elb:policies"
    name = "ConnectionDrainingEnabled"
    value = "${var.elb_connection_draining}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "${var.instance_type}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "RootVolumeType"
    value = "${var.instance_root_type}"
  }
	
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = "${var.eb_security_groups}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "${var.eb_iam_profile}"
  }
  
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = "${var.eb_key_pair}"
  }
  
  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "${var.asg_min_size}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = "${var.asg_max_size}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name = "BreachDuration"
    value = "${var.asg_trigger_breach_duration}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "MeasureName"
    value = "${var.asg_trigger_measure_name}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "Period"
    value = "${var.asg_trigger_period}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "Statistic"
    value = "${var.asg_trigger_statistic}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "Unit"
    value = "${var.asg_trigger_unit}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name  = "LowerBreachScaleIncrement"
    value = "${var.asg_trigger_lower_breach_scale_increment}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "UpperBreachScaleIncrement"
    value = "${var.asg_trigger_upper_breach_scale_increment}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "LowerThreshold"
    value = "${var.asg_trigger_lower_threshold}"
  }
  
	setting {
    namespace = "aws:autoscaling:trigger"
    name = "UpperThreshold"
    value = "${var.asg_trigger_upper_threshold}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "environment"
    value = "${var.eb_env}"
  }
 
 setting {
    namespace = "aws:elasticbeanstalk:sqsd"
    name = "WorkerQueueURL"
    value = "${var.sqs_arn}"
  }
 
  setting {
    namespace = "aws:elasticbeanstalk:sqsd"
    name = "HttpPath"
    value = "${var.sqs_path}"
  }
 
 setting {
    namespace = "aws:elasticbeanstalk:sqsd"
    name = "MimeType"
    value = "${var.sqs_mime}"
  }
}
