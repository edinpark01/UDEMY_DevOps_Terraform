resource "aws_instance" "ec2" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  # VPC subnet
  subnet_id = "${var.subnet_id}"

  # Security Group
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]

  # Public SSH key
  key_name = "${var.key_name}"
}
