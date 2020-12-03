resource "aws_instance" "gusta-ec2" {
  count = "${var.ec2_number}"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags = {
    "Name" = "${var.instance_name}-${count.index +1}"
  }
}