resource "aws_iam_role" "role_eks" {
  name = var.role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  tags = {
    Name = "role_eks"
  }
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKSClusterPolicy" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEC2ContainerRegistryFullAccess" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKSVPCResourceController" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}