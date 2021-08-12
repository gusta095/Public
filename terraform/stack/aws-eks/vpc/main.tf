# Criação da VPC
resource "aws_vpc" "vpc-teste" {
  cidr_block           = var.cidr-vpc
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "${var.vpc-name}"
  }
}

# Subnets-public
resource "aws_subnet" "subteste-public-1" {
  vpc_id                  = aws_vpc.vpc-teste.id
  cidr_block              = var.cidr-subpub-1
  map_public_ip_on_launch = var.public-ip-on
  availability_zone       = var.az-subpub-1

  tags = {
    Name = "${var.subnet-name-pub-1}"
  }
}

resource "aws_subnet" "subteste-public-2" {
  vpc_id                  = aws_vpc.vpc-teste.id
  cidr_block              = var.cidr-subpub-2
  map_public_ip_on_launch = var.public-ip-on
  availability_zone       = var.az-subpub-2

  tags = {
    Name = "${var.subnet-name-pub-2}"
  }
}

resource "aws_subnet" "subteste-public-3" {
  vpc_id                  = aws_vpc.vpc-teste.id
  cidr_block              = var.cidr-subpub-3
  map_public_ip_on_launch = var.public-ip-on
  availability_zone       = var.az-subpub-3

  tags = {
    Name = "${var.subnet-name-pub-3}"
  }
}

# Subnets-private
resource "aws_subnet" "subteste-private-1" {
  vpc_id                  = aws_vpc.vpc-teste.id
  cidr_block              = var.cidr-subpri-1
  map_public_ip_on_launch = var.public-ip-off
  availability_zone       = var.az-subpri-1

  tags = {
    Name = "${var.subnet-name-pri-1}"
  }
}

resource "aws_subnet" "subteste-private-2" {
  vpc_id                  = aws_vpc.vpc-teste.id
  cidr_block              = var.cidr-subpri-2
  map_public_ip_on_launch = var.public-ip-off
  availability_zone       = var.az-subpri-2

  tags = {
    Name = "${var.subnet-name-pri-2}"
  }
}

resource "aws_subnet" "subteste-private-3" {
  vpc_id                  = aws_vpc.vpc-teste.id
  cidr_block              = var.cidr-subpri-3
  map_public_ip_on_launch = var.public-ip-off
  availability_zone       = var.az-subpri-3

  tags = {
    Name = "${var.subnet-name-pri-3}"
  }
}


# Internet GW
resource "aws_internet_gateway" "igw-vpc" {
  vpc_id = aws_vpc.vpc-teste.id

  tags = {
    Name = "${var.igw-name}"
  }
}

# route tables
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc-teste.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-vpc.id
  }

  tags = {
    Name = "rt-public"
  }
}

# route associations public
resource "aws_route_table_association" "subteste-public-1-a" {
  subnet_id      = aws_subnet.subteste-public-1.id
  route_table_id = aws_route_table.rt-public.id
}

# nat gw
resource "aws_eip" "nat" {
  vpc = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.subteste-public-1.id
  # depends_on    = ["aws_internet_gateway.igw-vpc"]
}

# VPC setup for NAT
resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc-teste.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "rt-private"
  }
}
# route associations private
resource "aws_route_table_association" "subteste-private-1-a" {
  subnet_id      = aws_subnet.subteste-private-1.id
  route_table_id = aws_route_table.rt-private.id
}

