provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

resource "aws_instance" "gusta-ec2" {
  ami             = "ami-09e67e426f25ce0d7"
  instance_type   = "t2.micro"


  tags = var.tags
}
