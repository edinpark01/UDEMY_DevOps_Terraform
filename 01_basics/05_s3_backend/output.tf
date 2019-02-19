output "public-ip" {
  value = "${aws_instance.backend_example.public_ip}"
}
