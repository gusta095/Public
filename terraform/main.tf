provider "aws" {
  profile = "gusta-terraform"
  region = "us-east-1"
}

# module "keypair" {
#   source = "./modulos/keypair"
# }

module "ec2" {
  source = "./modulos/ec2"

  # key_name = "${module.keypair.key_name}"
}

# output

output "Public-IP" {
  value = "${module.ec2.Public-IP}"
}

output "Security-group-name" {
  value = "${module.ec2.Security-group-name}"
}

