resource "aws_autoscaling_group" "main" {
  name = "${var.env}-${var.name}-asg"
  launch_configuration = "${var.lc_id}"
  min_size = "${var.asg_min_size}"
  max_size = "${var.asg_max_size}"
  load_balancers = ["${var.load_balancer}"]
  target_group_arns = ["${var.target_group_arn}"]
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type = "${var.health_check_type}"
  vpc_zone_identifier = ["${var.asg_subnets}"]
  default_cooldown = "${var.asg_default_cooldown}"
  lifecycle {
    create_before_destroy = true
    ignore_changes = [ "desired_capacity", "max_size", "min_size" ]
  }
  tag {
    key = "Name"
    value = "${var.env}-${var.name}-srv"
    propagate_at_launch = true
  }
  tag {
    key = "Environment"
    value = "${var.env}"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "increase" {
  name = "${var.env}-${var.name}-increase-asg-policy"
  policy_type = "${var.increase_policy_type}"
  //scaling_adjustment = "${var.increase_scaling_simple_adj}"
  //cooldown = "${var.increase_simple_cooldown}"
  policy_type = "${var.increase_policy_type}"
  metric_aggregation_type = "${var.increase_metric_agg_type}"
  estimated_instance_warmup = "${var.increase_est_instance_warup}"
  step_adjustment { 
    scaling_adjustment = "${var.increase_scaling_adj}" 
    metric_interval_lower_bound = "${var.increase_metric_interval_lower}"
    metric_interval_upper_bound =  "${var.increase_metric_interval_upper}"
  }
  adjustment_type = "${var.increase_adj_type}"
  autoscaling_group_name = "${aws_autoscaling_group.main.name}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "decrease" {
  name = "${var.env}-${var.name}-decrease-asg-policy"
  //scaling_adjustment = "${var.decrease_scaling_simple_adj}"
  //cooldown = "${var.decrease_simple_cooldown}"
  policy_type = "${var.decrease_policy_type}"
  metric_aggregation_type = "${var.decrease_metric_agg_type}"
  estimated_instance_warmup = "${var.decrease_est_instance_warup}"
  step_adjustment { 
    scaling_adjustment = "${var.decrease_scaling_adj}"
     metric_interval_lower_bound = "${var.decrease_metric_interval_lower}"
     metric_interval_upper_bound =  "${var.decrease_metric_interval_upper}"
  }
  adjustment_type = "${var.decrease_adj_type}"

  autoscaling_group_name = "${aws_autoscaling_group.main.name}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_metric_alarm" "increase" {
  alarm_description = "This metric monitors increase in metrics utilization"
  alarm_actions = ["${aws_autoscaling_policy.increase.arn}"]
  alarm_name = "${var.env}-${var.name}-alarm-increase-asg"
  comparison_operator = "${var.alm_increase_comparison_operator}"
  evaluation_periods = "${var.alm_increase_eval_period}"
  threshold = "${var.alm_increase_threshold}"
  metric_name = "${var.alm_increase_metric_name}"
  namespace = "${var.alm_increase_namespace}"
  period = "${var.alm_increase_period}"
  statistic = "${var.alm_increase_statistic}"
  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_metric_alarm" "decrease" {
  alarm_description = "This metric monitors decrease in metrics utilization"
  alarm_actions     = ["${aws_autoscaling_policy.decrease.arn}"]
  alarm_name = "${var.env}-${var.name}-alarm-decrease-asg"
  comparison_operator = "${var.alm_decrease_comparison_operator}"
  evaluation_periods = "${var.alm_decrease_eval_period}"
  threshold = "${var.alm_decrease_threshold}"
  metric_name = "${var.alm_decrease_metric_name}"
  namespace = "${var.alm_decrease_namespace}"
  period = "${var.alm_decrease_period}"
  statistic = "${var.alm_decrease_statistic}"
  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
