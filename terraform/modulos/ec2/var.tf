variable "ami" {
  description = "Escolha de AMI"
  default     = "ami-00ddb0e5626798373"
}

variable "instance_type" {
  description = "Tipo de instancia"
  default     = "t2.micro"
}

variable "ec2_number" {
  description = "numero de instancias"
  default     = "1"
}

variable "instance_name" {
  description = "nome da instancias"
  default     = "gusta-ec2"
}

variable "key_name" {
  description = "Definição da chave de acesso"
  default     = "gusta-keypair"
}

variable "security_groups" {
  description = "security groups name"
  default     = "gusta-sg"
}

# Security-group

variable "sg_name" {
  description = "nome da security group"
  default     = "gusta-sg"
}

variable "acesso_SSH" {
  description = "meu IP de acesso"
  default     = "179.213.169.238/32"
}

variable "vpc_id" {
  description = "VPC padrão"
  default     = "vpc-51ce8b2b"
}

