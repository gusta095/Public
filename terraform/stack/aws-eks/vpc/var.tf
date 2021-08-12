variable "vpc-name" {
  description = "Nome da vpc"
  default     = "test-infra-pp"
}

variable "cidr-vpc" {
  description = "Range de IP da VPC"
  default     = "10.0.0.0/16"
}

variable "subnet-name-pub-1" {
  description = "Nome da subnet publica"
  default     = "subteste-public-1"
}

variable "subnet-name-pub-2" {
  description = "Nome da subnet publica"
  default     = "subteste-public-2"
}

variable "subnet-name-pub-3" {
  description = "Nome da subnet publica"
  default     = "subteste-public-3"
}

variable "subnet-name-pri-1" {
  description = "Nome da subnet privada"
  default     = "subteste-private-1"
}

variable "subnet-name-pri-2" {
  description = "Nome da subnet privada"
  default     = "subteste-private-2"
}

variable "subnet-name-pri-3" {
  description = "Nome da subnet privada"
  default     = "subteste-private-3"
}

variable "az-subpub-1" {
  description = "zona da subnet publica"
  default     = "us-east-1a"
}

variable "az-subpub-2" {
  description = "zona da subnet publica"
  default     = "us-east-1b"
}

variable "az-subpub-3" {
  description = "zona da subnet publica"
  default     = "us-east-1c"
}

variable "az-subpri-1" {
  description = "zona da subnet privada"
  default     = "us-east-1a"
}

variable "az-subpri-2" {
  description = "zona da subnet privada"
  default     = "us-east-1b"
}

variable "az-subpri-3" {
  description = "zona da subnet privada"
  default     = "us-east-1c"
}

variable "public-ip-on" {
  description = "atachar ip publico automaticamente"
  default     = "true"
}

variable "public-ip-off" {
  description = "atachar ip publico automaticamente"
  default     = "false"
}

variable "cidr-subpub-1" {
  description = "Range de IP da VPC"
  default     = "10.0.1.0/24"
}

variable "cidr-subpub-2" {
  description = "Range de IP da VPC"
  default     = "10.0.2.0/24"
}

variable "cidr-subpub-3" {
  description = "Range de IP da VPC"
  default     = "10.0.3.0/24"
}

variable "cidr-subpri-1" {
  description = "Range de IP da VPC"
  default     = "10.0.4.0/24"
}

variable "cidr-subpri-2" {
  description = "Range de IP da VPC"
  default     = "10.0.5.0/24"
}

variable "cidr-subpri-3" {
  description = "Range de IP da VPC"
  default     = "10.0.6.0/24"
}

variable "igw-name" {
  description = "nome do internet gateway"
  default     = "igw-vpc"
}
