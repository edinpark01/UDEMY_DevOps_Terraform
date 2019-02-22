variable "ami" {}

variable "instance_type" {}

variable "subnet_id" {}

variable "vpc_security_group_ids" {
  type = "list"
}

variable "key_name" {}
