variable "vpc-name" {
  description = "Nome da vpc"
  default     = "vpc-teste"
}

variable "cidr-vpc" {
  description = "Range de IP da VPC"
  default     = "10.0.0.0/16"
}

variable "subnet-name-pub" {
  description = "Nome da subnet publica"
  default     = "subteste-public-1"
}

variable "cidr-subpub" {
  description = "Range de IP da VPC"
  default     = "10.0.1.0/24"
}

variable "az-subpub" {
  description = "zona da subnet publica"
  default     = "us-east-1a"
}

variable "public-ip-on" {
  description = "atachar ip publico automaticamente"
  default     = "true"
}

variable "subnet-name-pri" {
  description = "Nome da subnet privada"
  default     = "subteste-private-1"
}

variable "cidr-subpri" {
  description = "Range de IP da VPC"
  default     = "10.0.2.0/24"
}

variable "az-subpri" {
  description = "zona da subnet privada"
  default     = "us-east-1a"
}

variable "public-ip-off" {
  description = "atachar ip publico automaticamente"
  default     = "false"
}

variable "igw-name" {
  description = "nome do internet gateway"
  default     = "igw-vpc"
}
