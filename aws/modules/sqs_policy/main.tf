resource "aws_sqs_queue_policy" "main" {
  queue_url = "${var.sqs_id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "${var.sqs_id}",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:*",
      "Resource": "${var.sqs_arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${var.sqs_source_arn}"
        }
      }
    },
	{
      "Sid": "Second",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "SQS:DeleteMessage",
        "SQS:SendMessage"
      ],
      "Resource": "${var.sqs_arn}" 
    }	
  ]
}
POLICY
}
