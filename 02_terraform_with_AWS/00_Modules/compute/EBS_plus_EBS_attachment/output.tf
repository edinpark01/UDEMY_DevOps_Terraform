output "EBS-ARN" {
  value = "${aws_ebs_volume.ebs_volume.arn}"
}

output "EBS-ID" {
  value = "${aws_ebs_volume.ebs_volume.id}"
}