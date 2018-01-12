resource "aws_iam_role" "main" {
  name = "${var.env}-${var.name}-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "main" {
  name = "${var.env}-${var.name}-iam-role-policy"
  role = "${aws_iam_role.main.id}"
  policy = "${var.iam_policy}"
}

