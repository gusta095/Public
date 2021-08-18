output "vpc_id" {
  value = aws_vpc.vpc-teste.id
}
output "public_subnets" {
  value = join(",", aws_subnet.subteste-public-1.*.id)
}

output "private_subnets" {
  value = join(",", aws_subnet.subteste-private-1.*.id)
}

