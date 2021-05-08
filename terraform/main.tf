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


