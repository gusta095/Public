provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

module "vpc" {
  source = "./new_modules/vpc"

}