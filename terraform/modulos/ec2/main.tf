resource "aws_instance" "gusta-ec2" {
  count           = "${var.ec2_number}"
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  # key_name        = "${var.key_name}"
  key_name        = "gusta-key.pem"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${aws_security_group.gusta-sg.id}"]
  # security_groups = ["sg-01fd8f7485a7ab32a"]

  tags = {
    "Name" = "${var.instance_name}-${count.index +1}"
  }
}

resource "aws_security_group" "gusta-sg" {
  description = "Libera todo o trafego"
  name        = "${var.sg_name}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.acesso_SSH}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.sg_name}"
  }
}

