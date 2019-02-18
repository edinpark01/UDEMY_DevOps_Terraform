# This example adds a security group
provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_instance" "data_source_example" {
  ami = "${lookup(var.AMIs, var.AWS_REGION)}"
  instance_type = "t2.micro"
}

data "aws_ip_ranges" "american_ec2" {
  regions = ["us-east-1", "us-west-1"]
  services = ["ec2"]
}

resource "aws_security_group" "from_usa" {
  name = "from_usa"

  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = ["${data.aws_ip_ranges.american_ec2.cidr_blocks}"]
  }
  tags {
    CreateDate = "${data.aws_ip_ranges.american_ec2.create_date}"
    SyncToken = "${data.aws_ip_ranges.american_ec2.sync_token}"
  }
}
