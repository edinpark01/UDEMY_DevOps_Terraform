# Internet Network - MAIN resource
resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_classiclink   = "${var.enable_classiclink}"

  tags {
    Name = "${var.VPC_tag_name}"
  }
}