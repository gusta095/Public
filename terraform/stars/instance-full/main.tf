provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

data "terraform_remote_state" "state" {
  backend              = "s3"
  workspace = "state"
  config = {
    bucket = "terraform-historico"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
  source = "./modulos/vpc"
}
module "keypair" {
  source = "./modulos/keypair"
}
module "security-group" {
  source = "./modulos/security-group"

  vpc_id          = "${module.vpc.vpc_id}"
}
module "ec2" {
  source = "./modulos/ec2"

  key_name        = "${module.keypair.key_name}"
  security_groups = "${module.security-group.id}"
  subnet_id       = "${module.vpc.public_subnets}"
}


output "Instance-id" {
  value = "${module.ec2.Instance-id}"
}
output "Public-IP" {
  value = "${module.ec2.Public-IP}"
}
output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
output "public_subnets" {
    value = "${module.vpc.public_subnets}"
}
output "private_subnets" {
    value = "${module.vpc.private_subnets}"
}
