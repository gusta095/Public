provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

module "queue-sqs" {
  source = "./modulos/queue-sqs"
}
