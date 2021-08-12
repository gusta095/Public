provider "aws" {
  region  = "us-east-1"
  profile = "testenv"
}

module "vpc" {
  source = "./vpc"
}