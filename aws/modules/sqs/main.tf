resource "aws_sqs_queue" "main" {
  name                      = "${var.env}-${var.name}-sqs"
//  delay_seconds             = "${var.delay_seconds}"
//  max_message_size          = "${var.max_message_size}"
//  message_retention_seconds = "${var.message_ret_secs}"
//  receive_wait_time_seconds = "${var.rec_wait_time_secs}"
  tags {
      Environment = "${var.env}"
      }
}
