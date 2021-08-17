# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# internet gateway
resource "aws_internet_gateway" "ig_vpc_main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.ig_name
  }
}

#nat gw
resource "aws_eip" "eip_nat_main" {
  vpc = true

  tags = {
    Name = var.eip_name
  }
}
resource "aws_nat_gateway" "nat-gw_main" {
  allocation_id = aws_eip.eip_nat_main.id
  subnet_id     = aws_subnet.sub_public_1.id

  tags = {
    Name = var.nat_gw_name
  }
}

# route tables
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_vpc_main.id
  }

  tags = {
    Name = var.rt_public_name
  }
}

resource "aws_route_table_association" "rta_sub_public_1" {
  subnet_id      = aws_subnet.sub_public_1.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rta_sub_public_2" {
  subnet_id      = aws_subnet.sub_public_2.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "rta_sub_public_3" {
  subnet_id      = aws_subnet.sub_public_3.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw_main.id
  }

  tags = {
    Name = var.rt_private_name
  }
}

resource "aws_route_table_association" "rta_sub_private_1" {
  subnet_id      = aws_subnet.sub_private_1.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rta_sub_private_2" {
  subnet_id      = aws_subnet.sub_private_2.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "rta_sub_private_3" {
  subnet_id      = aws_subnet.sub_private_3.id
  route_table_id = aws_route_table.rt_private.id
}

# Private subnet
resource "aws_subnet" "sub_private_1" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.1.0/24"

  tags = {
    Name = var.sub_private_1
  }
}

resource "aws_subnet" "sub_private_2" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.2.0/24"

  tags = {
    Name = var.sub_private_2
  }
}

resource "aws_subnet" "sub_private_3" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.3.0/24"

  tags = {
    Name = var.sub_private_3
  }
}

# Public Subnet

resource "aws_subnet" "sub_public_1" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.4.0/24"

  tags = {
    Name = var.sub_public_1
  }
}

resource "aws_subnet" "sub_public_2" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.5.0/24"

  tags = {
    Name = var.sub_public_2
  }
}

resource "aws_subnet" "sub_public_3" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.6.0/24"

  tags = {
    Name = var.sub_public_3
  }
}