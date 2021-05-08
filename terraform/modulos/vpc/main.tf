# Criação da VPC
resource "aws_vpc" "vpc-teste" {
    cidr_block = "${var.cidr-vpc}"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"

    tags = {
        "Name" = "${var.vpc-name}"
    }
}

# Subnets
resource "aws_subnet" "subteste-public-1" {
    vpc_id = "${aws_vpc.vpc-teste.id}"
    cidr_block = "${var.cidr-subpub}"
    map_public_ip_on_launch = "${var.public-ip-on}"
    availability_zone = "${var.az-subpub}"

    tags = {
        "Name" = "${var.subnet-name-pub}"
    }
}
resource "aws_subnet" "subteste-private-1" {
    vpc_id = "${aws_vpc.vpc-teste.id}"
    cidr_block = "${var.cidr-subpri}"
    map_public_ip_on_launch = "${var.public-ip-off}"
    availability_zone = "${var.az-subpri}"

    tags = {
        "Name" = "${var.subnet-name-pri}"
    }
}

# Internet GW
resource "aws_internet_gateway" "igw-vpc" {
    vpc_id = "${aws_vpc.vpc-teste.id}"

    tags = {
        Name = "${var.igw-name}"
    }
}

# route tables
resource "aws_route_table" "rt-public" {
    vpc_id = "${aws_vpc.vpc-teste.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw-vpc.id}"
    }

    tags = {
        "Name" = "${var.subnet-name-pub}"
    }
}

# route associations public
resource "aws_route_table_association" "subteste-public-1-a" {
    subnet_id = "${aws_subnet.subteste-public-1.id}"
    route_table_id = "${aws_route_table.rt-public.id}"
}

# nat gw
resource "aws_eip" "nat" {
    vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
    allocation_id = "${aws_eip.nat.id}"
    subnet_id = "${aws_subnet.subteste-public-1.id}"
    depends_on = ["aws_internet_gateway.igw-vpc"]
}

# VPC setup for NAT
resource "aws_route_table" "rt-private" {
    vpc_id = "${aws_vpc.vpc-teste.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }

    tags = {
        "Name" = "${var.subnet-name-pri}"
    }
}
# route associations private
resource "aws_route_table_association" "subteste-private-1-a" {
    subnet_id = "${aws_subnet.subteste-private-1.id}"
    route_table_id = "${aws_route_table.rt-private.id}"
}

