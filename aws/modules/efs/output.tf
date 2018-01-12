output "efs_id" {
  value = "${aws_efs_mount_target.main.id}"
}

output "efs_dns" {
  value = "${aws_efs_mount_target.main.*.dns_name}"
}

