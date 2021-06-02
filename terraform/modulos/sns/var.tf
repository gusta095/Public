variable "topic-name" {
  default     = "gusta-topic"
}

variable "subscription-protocol" {
  default     = "sqs"
}

variable "subscription-endpoint" {
  default     = "arn:aws:sqs:us-east-1:936943748055:gusta-teste"
}