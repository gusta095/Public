resource "aws_instance" "gusta-ec2" {
  count           = var.instance_number
  ami             = var.ami
  instance_type   = var.instance_type
  # key_name        = var.key_name
  # subnet_id       = var.subnet_id
  # security_groups = var.security_groups

  tags = {
    Name = "${var.tags}-${count.index + 1}"
  }
}
