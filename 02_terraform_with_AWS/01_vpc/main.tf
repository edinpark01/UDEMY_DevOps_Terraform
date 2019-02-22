variable "AWS_REGION" {
  default = "us-east-1"
}

provider "aws" {
  region = "${var.AWS_REGION}"
}

# Internet Network - Main Resource
module "vpc" {
  source = "../00_Modules/network/vpc"

  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  VPC_tag_name = "main"
}


module "subnet-public-1" {
  source = "../00_Modules/network/subnet"

  cidr_block              = "10.0.1.0/24"
  vpc_id                  = "${module.vpc.vpc-id}"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  subnet_tag_name = "subnet-public-1"
}

module "subnet-private-1" {
  source = "../00_Modules/network/subnet"

  cidr_block              = "10.0.2.0/24"
  vpc_id                  = "${module.vpc.vpc-id}"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  subnet_tag_name = "subnet-private-1"
}

# Internet Gateway
module "internet-gateway" {
  source = "../00_Modules/network/gateway"

  vpc_id           = "${module.vpc.vpc-id}"
  gateway_tag_name = "main-gateway"
}

# Routing Table
module "routing-table" {
  source = "../00_Modules/network/route_table"

  vpc_id = "${module.vpc.vpc-id}"

  # Route
  cidr_block = "0.0.0.0/0"
  gateway_id = "${module.internet-gateway.gateway-id}"

  gateway_tag_name = "main-routing-table"
}


# Routing Table - Associations (Public)
module "routing-table-association" {
  source = "../00_Modules/network/route_table_associations"

  route_table_id = "${module.routing-table.route-table-id}"
  subnet_id = "${module.subnet-public-1.subnet-id}"
}