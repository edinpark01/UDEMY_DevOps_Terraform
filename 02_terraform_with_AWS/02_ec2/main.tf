provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "../00_Modules/compute/instance/"

  # VPC configuration
  vpc_security_group_ids = ["${module.security_group.SECURITY_GROUP_ID}"]

  # EC2 configuration
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${module.key_pair.KEY_NAME}"
  subnet_id     = "${module.vpc.PUBLIC_SUBNET_ID}"
}

module "vpc" {
  source = "../01_vpc"
}

module "key_pair" {
  source = "../00_Modules/compute/network_security/key_pairs"

  key_name   = "${var.public_key_name}"
  public_key = "${var.path_to_public_key}"
}

module "security_group" {
  source = "../00_Modules/compute/network_security/security_groups"

  name   = "ssh"
  vpc_id = "${module.vpc.VPC_ID}"

  description = "this security groups configures ssh connections"

  ing_to_port   = "22"
  ing_from_port = "22"
  ing_protocol  = "TCP"
  ing_cidr_blocs = "0.0.0.0/0"

  eg_to_port   = "0"
  eg_from_port = "0"
  eg_protocol  = "-1"
  eg_cidr_blocs = "0.0.0.0/0"

  security_group_tag_name = "Allow SSH"
}
