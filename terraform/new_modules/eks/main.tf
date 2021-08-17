provider "aws" {
  profile = "gusta-terraform"
  region  = "us-east-1"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "infra-test"
  role_arn = aws_iam_role.role_eks.arn
  version  = "1.20"

  vpc_config {
    subnet_ids = ["subnet-7424135a", "subnet-6f807822"]
  }
  tags = {
    Name = "infra-test"
  }
}


