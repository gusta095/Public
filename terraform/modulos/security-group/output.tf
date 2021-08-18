output "id" {
  value = aws_security_group.gusta-sg.*.id
}

output "arn" {
  value = aws_security_group.gusta-sg.*.arn
}

output "name" {
  value = aws_security_group.gusta-sg.*.name
}

output "vpc" {
  value = aws_security_group.gusta-sg.*.vpc_id
}

output "inbound-rules" {
  value = aws_security_group.gusta-sg.*.ingress
}
