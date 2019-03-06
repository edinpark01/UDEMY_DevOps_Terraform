resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-1"
  size = "10"
  type = "go2"  # General Purpose storage, can also be standard or io1 or st1

  tags {
    Name = "10GB extra volume"
  }
}