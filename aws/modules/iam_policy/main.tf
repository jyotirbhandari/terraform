resource "aws_iam_role_policy" "main" {
  name = "${var.env}-${var.name}-iam-role-policy"
  role = "${var.role_id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "AllowEC2",
        "Effect": "Allow",
        "Action": [
            "ec2:*",
            "elasticloadbalancing:*",
            "autoscaling:*"
        ],
        "Resource": "*"
    }
  ]
}
EOF
}
