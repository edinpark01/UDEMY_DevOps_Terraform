provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_instance" "module_example" {
  ami           = "${lookup(var.AMIs, var.AWS_REGION)}"
  instance_type = "${var.INSTANCE_TYPE}"
  key_name      = "${var.KEY_NAME}"
}
