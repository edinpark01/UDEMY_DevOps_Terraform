resource "aws_internet_gateway" "gateway" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "${var.gateway_tag_name}"
  }
}
