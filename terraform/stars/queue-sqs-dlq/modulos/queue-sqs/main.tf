resource "aws_sqs_queue" "gusta_queue-dlq" {
  name                        = "${var.name-dlq}"
  visibility_timeout_seconds  = "${var.visibility_timeout_seconds}"
  delay_seconds               = "${var.delay_seconds}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
}

resource "aws_sqs_queue" "gusta_queue" {
  name                        = "${var.name}"
  visibility_timeout_seconds  = "${var.visibility_timeout_seconds}"
  delay_seconds               = "${var.delay_seconds}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  redrive_policy = jsonencode({
    deadLetterTargetArn = "${aws_sqs_queue.gusta_queue-dlq.arn}"
    maxReceiveCount     = 10
  })
}