provider "aws" {
  profile = "gusta-terraform"
  region = "us-east-1"
}

module "security-group" {
  source = "./modulos/security-group"
}
module "keypair" {
  source = "./modulos/keypair"
}
module "ec2" {
  source = "./modulos/ec2"

  key_name        = "${module.keypair.key_name}"
  security_groups = "${module.security-group.id}"
}


output "Instance-id" {
  value = "${module.ec2.Instance-id}"
}
output "Public-IP" {
  value = "${module.ec2.Public-IP}"
}