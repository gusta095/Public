provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}