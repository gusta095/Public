provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

module "s3-default" {
  source = "./modulos/s3-default"
}