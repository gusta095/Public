provider "aws" {
  profile = "gusta-terraform"
  region = "us-east-1"
}

resource "aws_instance" "gusta-terraform" {
  ami = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"

}