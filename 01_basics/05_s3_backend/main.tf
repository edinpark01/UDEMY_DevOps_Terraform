provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_instance" "backend_example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.backend_example.private_ip} >> private_ips.txt"
  }
}
