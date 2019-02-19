provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
}

resource "aws_instance" "output_example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.output_key.key_name}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.output_example.private_ip} >> private_ips.txt"
  }
}

resource "aws_key_pair" "output_key" {
  key_name = "output_key"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

