# VPC
variable "vpc_name" {
  description = "Nome da VPC"
  default     = "vpc_infra-test"
}

variable "ig_name" {
  description = "Nome do internet gateway"
  default     = "ig_infra-test"
}

variable "rt_public_name" {
  description = "Nome da route table publica"
  default     = "rt_public_infra-test"
}

variable "template_public_subnet" {
  description = "template para subnet publicas"
  type        = any
  default     = [
    {
      cidr_block        = "10.0.101.0/24"
      availability_zone = "us-east-1a"
    }]
}

variable "template_private_subnet" {
  description = "template para subnet privadas"
  type        = any
  default     = [
    {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
    }]
}

# Privete subnet

# Public subnet
