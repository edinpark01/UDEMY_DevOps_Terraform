variable "AWS_REGION" {
  default = "us-east-1"
}

provider "aws" {
  region = "${var.AWS_REGION}"
}

module "VPC_modular_example" {
  source = "../00_Modules/VPC"
}
