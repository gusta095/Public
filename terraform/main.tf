provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

data "terraform_remote_state" "state" {
  backend              = "s3"
  workspace = "state"
  config = {
    bucket = "terraform-historico"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_sqs_queue" "gusta_queue-dlq" {
  name                        = "gusta-queue-dlq"
  visibility_timeout_seconds  = 30
  delay_seconds               = 0
  message_retention_seconds   = 1209600
  receive_wait_time_seconds   = 0
}

resource "aws_sqs_queue" "gusta_queue" {
  name                        = "gusta-queue"
  visibility_timeout_seconds  = 30
  delay_seconds               = 0
  message_retention_seconds   = 1209600
  receive_wait_time_seconds   = 0
  redrive_policy = jsonencode({
    deadLetterTargetArn = "${aws_sqs_queue.gusta_queue-dlq.arn}"
    maxReceiveCount     = 10
  })
}


