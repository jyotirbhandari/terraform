output "asg_id" {
  value = "${aws_autoscaling_group.main.id}"
}

output "asg_policy_increase_arn" {
  value = "${aws_autoscaling_policy.increase.arn}"
}

output "asg_policy_decrease_arn" {
  value = "${aws_autoscaling_policy.decrease.arn}"
}

output "asg_name" {
  value = "${aws_autoscaling_group.main.name}"
}
