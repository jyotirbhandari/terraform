variable "env" {
  description = "Name of the respective environment"
  default = ""
}

variable "name" {
  description = "Name of the sqs"
  default = ""
}

variable "delay_seconds" {
  description = "SQS delay seconds"
  default = ""
}

variable "max_message_size" {
  description = "Maximum message size in queue"
  default = ""
}

variable "message_ret_secs" {
  description = "Message retention in SQS in seconds"
  default = ""
}

variable "rec_wait_time_secs" {
  description = "Recieve message time wait"
  default = ""
}

