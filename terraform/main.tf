provider "aws" {
  profile = "gusta-terraform"
  region = "us-east-1"
}

module "ec2" {
  source = "./modulos/ec2"
}

output "Public-IP" {
  value = "${module.ec2.Public-IP}"
}