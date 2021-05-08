variable "instance_number" {
  default = "1"
}

variable "ami" {
  default = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "gusta-keypair-teste"
}

variable "subnet_id" {
  default = "subnet-7424135a"
}

variable "security_groups" {
  default = "sg-00000000000"
}

variable "tags" {
  default = "gusta-ec2"
}