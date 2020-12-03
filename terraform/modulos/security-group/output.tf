output "Security-group-id" {
  value = "${aws_security_group.gusta-sg.*.id}"
}

output "Security-group-arn" {
  value = "${aws_security_group.gusta-sg.*.arn}"
}

output "Security-group-name" {
  value = "${aws_security_group.gusta-sg.*.name}"
}

output "Security-group-vpc" {
  value = "${aws_security_group.gusta-sg.*.vpc_id}"
}

output "Security-group-inbound-rules" {
  value = "${aws_security_group.gusta-sg.*.ingress}"
}
