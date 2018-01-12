resource "aws_autoscaling_schedule" "main" {
  autoscaling_group_name = "${var.asg_name}"
  scheduled_action_name = "${var.env}-${var.name}-schedule-asg"
  min_size = "${var.min_schedule_size}"
  max_size = "${var.max_schedule_size}"
  desired_capacity = "${var.desired_schedule_size}"
  recurrence = "${var.recurrence}"
}
