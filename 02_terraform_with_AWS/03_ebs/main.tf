variable "AWS_REGION" {
  default = "us-east-1"
}

provider "aws" {
  region = "${var.AWS_REGION}"
}

module "ec2" {
  source = "../00_Modules/compute/instance"

  # VPC
  subnet_id = "${module.vpc.PUBLIC_SUBNET_ID}"

  # EC2 Configuration
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"

  # Network and Security
  key_name               = "${module.key_pair.KEY_NAME}"
  vpc_security_group_ids = ["${module.security_group.SECURITY_GROUP_ID}"]
}

module "vpc" {
  source = "../01_vpc"
}

module "key_pair" {
  source = "../00_Modules/compute/network_security/key_pairs"

  key_name   = "EBS example KeyPair"
  public_key = "ebs_example_key.pub"
}

module "security_group" {
  source = "../00_Modules/compute/network_security/security_groups"

  vpc_id      = "${module.vpc.VPC_ID}"
  name        = "SSH"
  description = "Allows SSH into EC2 instance"

  ing_cidr_blocs = "0.0.0.0/0"
  ing_from_port  = "22"
  ing_to_port    = "22"
  ing_protocol   = "TCP"

  eg_cidr_blocs = "0.0.0.0/0"
  eg_to_port    = "0"
  eg_from_port  = "0"
  eg_protocol   = "-1"

  security_group_tag_name = "Allow SSH"
}

module "ebs" {
  source = "../00_Modules/compute/EBS_plus_EBS_attachment"

  # EBS Volume
  availability_zone = "us-east-1a"
  size              = "10"
  type              = "gp2"

  # EBS Volume Attachment
  device_name  = "/dev/sdf"
  instance_id  = "${module.ec2.INSTANCE_ID}"
  volume_id    = "${module.ebs.EBS-ID}"
  force_detach = "true"
}
