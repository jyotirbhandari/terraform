resource "aws_launch_configuration" "main" {
  name = "${var.env}-${var.name}-lc"
  image_id = "${var.lc_ami_id}"
  instance_type = "${var.lc_instance_type}"
  key_name = "${var.lc_key_name}"
  security_groups = ["${var.lc_security_group}"]
  enable_monitoring = false
  lifecycle {
    create_before_destroy = true
  }
}

