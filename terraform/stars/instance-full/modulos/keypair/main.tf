locals {
  public_key_filename  = "${var.ssh_public_key_path}/${var.client_name}-${var.environment}${var.public_key_extension}"
  private_key_filename = "${var.ssh_public_key_path}/${var.client_name}-${var.environment}${var.private_key_extension}"
}

resource "tls_private_key" "default" {
  algorithm = "${var.ssh_key_algorithm}"
}

resource "aws_key_pair" "generated" {
  depends_on = ["tls_private_key.default"]
  key_name   = "${var.client_name}-${var.environment}"
  public_key = "${tls_private_key.default.public_key_openssh}"
}

resource "local_file" "public_key_openssh" {
  depends_on = ["tls_private_key.default"]
  content    = "${tls_private_key.default.public_key_openssh}"
  filename   = "${local.public_key_filename}"
}

resource "local_file" "private_key_pem" {
  depends_on = ["tls_private_key.default"]
  content    = "${tls_private_key.default.private_key_pem}"
  filename   = "${local.private_key_filename}"
}