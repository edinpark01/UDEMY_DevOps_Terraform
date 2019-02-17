output "public-ip" {
  value = "${aws_instance.output_example.public_ip}"
}