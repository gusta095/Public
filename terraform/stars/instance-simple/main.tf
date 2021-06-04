provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}


module "keypair" {
  source = "git::https://github.com/gusta095/module-terraform-keypair.git"
}
module "ec2" {
  source = "git::https://github.com/gusta095/module-terraform-ec2.git"

  key_name = module.keypair.key_name
}


output "Instance-id" {
  value = module.ec2.Instance-id
}
output "Public-IP" {
  value = module.ec2.Public-IP
}