resource "aws_instance" "gusta-ec2" {
  count = "${var.ec2_number}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name        = "${var.key_name}"
  security_groups = ["${aws_security_group.gusta-sg.id}"]

  tags = {
    "Name" = "${var.instance_name}-${count.index +1}"
  }
}

resource "aws_security_group" "gusta-sg" {
  name = "${var.sg_name}"

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