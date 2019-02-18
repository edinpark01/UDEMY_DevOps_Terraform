resource "aws_key_pair" "module_example_key" {
  key_name   = "${var.KEY_NAME}"
  public_key = "${file("${var.PUBLIC_KEY}")}"
}
