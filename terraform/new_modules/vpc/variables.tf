# VPC
variable "vpc_name" {
  description = "Nome da VPC"
  default     = "vpc_infra-test"
}

variable "ig_name" {
  description = "Nome do internet gateway"
  default     = "ig_infra-test"
}

variable "eip_name" {
  description = "Nome do elastic IP"
  default     = "eip_nat_gw_infra-test"
}

variable "nat_gw_name" {
  description = "Nome do nat gateway"
  default     = "nat_gw_infra-test"
}

variable "rt_public_name" {
  description = "Nome da route table publica"
  default     = "rt_public_infra-test"
}

variable "rt_private_name" {
  description = "Nome da route table privada"
  default     = "rt_private_infra-test"
}

# Privete subnet
variable "sub_private_1" {
  description = "Nome das subnets privadas"
  default     = "sub_private_1"
}

variable "sub_private_2" {
  description = "Nome das subnets privadas"
  default     = "sub_private_2"
}

variable "sub_private_3" {
  description = "Nome das subnets privadas"
  default     = "sub_private_3"
}

# Public subnet
variable "sub_public_1" {
  description = "Nome das subnets publicas"
  default     = "sub_public_1"
}

variable "sub_public_2" {
  description = "Nome das subnets publicas"
  default     = "sub_public_2"
}

variable "sub_public_3" {
  description = "Nome das subnets publicas"
  default     = "sub_public_3"
}