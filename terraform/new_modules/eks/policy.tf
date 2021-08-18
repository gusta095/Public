resource "aws_iam_role" "role_eks" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.role_eks_data.json

  tags = {
    Name = "role_eks"
  }
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKSClusterPolicy" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKSServicePolicy" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonEKSVPCResourceController" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
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

resource "aws_iam_role_policy_attachment" "policy-attach_AWSWAFFullAccess" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AWSWAFFullAccess"
}

resource "aws_iam_role_policy_attachment" "policy-attach_AmazonCognitoReadOnly" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoReadOnly"
}

resource "aws_iam_role_policy_attachment" "policy-attach_IAMFullAccess" {
  role       = aws_iam_role.role_eks.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}