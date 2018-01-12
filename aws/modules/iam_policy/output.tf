output "iam_policy_arn" {
  value = "${aws_iam_role_policy.main.arn}"
}

output "iam_policy_id" {
  value = "${aws_iam_role_policy.main.id}"
}

output "iam_policy_name" {
  value = "${aws_iam_role_policy.main.name}"
}
