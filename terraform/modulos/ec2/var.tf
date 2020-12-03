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
  default     = "2"
}

variable "instance_name" {
  description = "nome da instancias"
  default     = "gusta-ec2"
}