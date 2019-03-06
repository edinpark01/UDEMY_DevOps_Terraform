output "INSTANCE_PUBLIC_IP" {
  value = "${aws_instance.ec2.public_ip}"
}

output "INSTANCE_ID" {
  value = "${aws_instance.ec2.id}"
}