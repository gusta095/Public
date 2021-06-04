variable "instance_number" {
  type    = number
  default = 1
}

variable "ami" {
  type    = string
  default = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "gusta-keypair-teste"
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "security_groups" {
  type    = string
  default = ""
}

variable "tags" {
  default = "gusta-ec2"
}