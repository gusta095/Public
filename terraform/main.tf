provider "aws" {
  profile = "gusta-terraform"
  region = "us-east-1"
}

module "security-group" {
  source = "./modulos/security-group"
}

module "ec2" {
  source = "./modulos/ec2"

  # key_name = "${module.security-group.id}"
}

# output

output "Public-IP" {
  value = "${module.ec2.Public-IP}"
}

output "Security-group-name" {
  value = "${module.security-group.Security-group-name}"
}

