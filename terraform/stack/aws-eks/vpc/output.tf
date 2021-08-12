output "vpc_id" {
  value = aws_vpc.vpc-teste.id
}
output "public_subnets-1" {
  value = join(",", aws_subnet.subteste-public-1.*.id)
}

output "public_subnets-2" {
  value = join(",", aws_subnet.subteste-public-2.*.id)
}

output "public_subnets-3" {
  value = join(",", aws_subnet.subteste-public-3.*.id)
}

output "private_subnets-1" {
  value = join(",", aws_subnet.subteste-private-1.*.id)
}

output "private_subnets-2" {
  value = join(",", aws_subnet.subteste-private-2.*.id)
}

output "private_subnets-3" {
  value = join(",", aws_subnet.subteste-private-3.*.id)
}
