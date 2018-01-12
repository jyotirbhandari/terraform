output "sqs_policy_url" {
  value="${aws_sqs_queue_policy.main.queue_url}"
}
