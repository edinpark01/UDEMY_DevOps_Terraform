resource "aws_ebs_volume" "ebs_volume" {
  # Types of volumes:
  #
  # FAST    - General Purpose storage (SSD) - Very useful for the majority of users, specifically for larger volumes needs.
  # SLOW    - Standard (Magnetic)           - Only useful for little to no data access.
  # FASTEST - Provisioned IOPS (SSD)        - Most useful for users needing high speed.
  #
  # NOTE: Free tier eligible customers can get up to 30 GB of EBS General Purpose (SSD) or Magnetic storage.

  availability_zone = "${var.availability_zone}"
  size              = "${var.size}"
  type              = "${var.type}"

  tags {
    Name = "${var.volume_tag_name}"
  }
}


resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name  = "${var.device_name}"
  instance_id  = "${var.instance_id}"
  volume_id    = "${var.volume_id}"

  force_detach = "${var.force_detach}"
}