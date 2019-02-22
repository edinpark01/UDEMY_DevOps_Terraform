resource "aws_security_group" "security_group" {
  vpc_id = "${var.vpc_id}"

  name        = "${var.name}"
  description = "${var.description}"

  ingress {
    from_port   = "${var.ing_from_port}"
    to_port     = "${var.ing_to_port}"
    protocol    = "${var.ing_protocol}"
    cidr_blocks = ["${var.ing_cidr_blocs}"]
  }

  egress {
    from_port   = "${var.eg_from_port}"
    to_port     = "${var.eg_to_port}"
    protocol    = "${var.eg_protocol}"
    cidr_blocks = ["${var.eg_cidr_blocs}"]
  }

  tags {
    Name = "${var.security_group_tag_name}"
  }
}
