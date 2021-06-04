provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

module "vpc" {
  source = "git::https://github.com/gusta095/module-terraform-vpc.git"
}
module "keypair" {
  source = "git::https://github.com/gusta095/module-terraform-keypair.git"
}
module "ec2" {
  source = "git::https://github.com/gusta095/module-terraform-ec2.git"

  key_name  = module.keypair.key_name
  subnet_id = module.vpc.public_subnets
  vpc_id    = module.vpc.vpc_id
}


output "Instance-id" {
  value = module.ec2.Instance-id
}
output "Public-IP" {
  value = module.ec2.Public-IP
}
output "vpc_id" {
    value = module.vpc.vpc_id
}
output "public_subnets" {
    value = module.vpc.public_subnets
}
output "private_subnets" {
    value = module.vpc.private_subnets
}
