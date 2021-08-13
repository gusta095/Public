# VPC

output "vpc_arn" {
  value = aws_vpc.main.arn
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cird" {
  value = aws_vpc.main.cidr_block
}

output "ig_id" {
  value = aws_internet_gateway.ig_vpc_main.id
}

output "nat_gw_id" {
  value = aws_nat_gateway.nat-gw_main.id
}

output "eip_id" {
  value = aws_eip.eip_nat_main.id
}

output "rt_public_id" {
  value = aws_route_table.rt_public.id
}

output "rt_private_id" {
  value = aws_route_table.rt_private.id
}

# subnet

output "sub_private_1" {
  value = aws_subnet.sub_private_1.id
}

output "sub_private_2" {
  value = aws_subnet.sub_private_2.id
}

output "sub_private_3" {
  value = aws_subnet.sub_private_3.id
}

output "sub_public_1" {
  value = aws_subnet.sub_public_1.id
}

output "sub_public_2" {
  value = aws_subnet.sub_public_2.id
}

output "sub_public_3" {
  value = aws_subnet.sub_public_3.id
}
