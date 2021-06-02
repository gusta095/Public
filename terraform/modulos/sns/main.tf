resource "aws_sns_topic" "gusta-topic" {
  name = "${var.topic-name}"
}

resource "aws_sns_topic_subscription" "gusta-topic-subscription" {
  topic_arn = "${aws_sns_topic.gusta-topic.arn}"
  protocol  = "${var.subscription-protocol}"
  endpoint  = "${var.subscription-endpoint}"
  raw_message_delivery = true
}



