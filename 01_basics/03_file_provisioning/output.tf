output "machine public-ip" {
  value = "${aws_instance.file_provisioning_example.public_ip}"
}
