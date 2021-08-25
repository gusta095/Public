provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

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

resource "aws_route_table_association" "rta_public_subnet" {
  count          = length(var.template_public_subnet)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.rt_public.id
}



# Private subnet
resource "aws_subnet" "private_subnet" {
  count                   = length(var.template_private_subnet)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = false
  cidr_block              = lookup(var.template_private_subnet[count.index],"cidr_block", null)
  availability_zone       = lookup(var.template_private_subnet[count.index],"availability_zone", null)

  tags = {
    Name = "private_subnet"
  }
}

# Public Subnet

resource "aws_subnet" "public_subnet" {
  count                   = length(var.template_public_subnet)
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = lookup(var.template_public_subnet[count.index],"cidr_block", null)
  availability_zone       = lookup(var.template_public_subnet[count.index],"availability_zone", null)

  tags = {
    Name = "public_subnet"
  }
}
