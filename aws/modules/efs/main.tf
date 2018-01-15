resource "aws_efs_file_system" "main" {
  performance_mode = "${var.perf_mode}"
  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name = "${var.env}-${var.name}-efs" 
    Environment = "${var.env}"
  }
}

resource "aws_efs_mount_target" "main" {
  count = "${length(split(",", var.efs_subnet_ids))}"
  file_system_id = "${aws_efs_file_system.main.id}"
  subnet_id      = "${element(split(",", var.efs_subnet_ids), count.index)}"
  security_groups = ["${var.efs_security_groups}"]
  lifecycle {
    create_before_destroy = true
  }
}
