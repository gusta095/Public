provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

module "website" {
  source = "./module-website-s3"
}



