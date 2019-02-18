provider "aws" {
  region = "${var.AWS_REGION}"
}

module "module_example_EC2" {
  source   = "./EC2"
  KEY_NAME = "${module.module_example_KEY_PAIR.key-name}" # NEED output.tf file in KEY_PAIR module directory
                                                          # SO EC2 isntance may retrieve/attach it during initialization
  #TODO: Secutiry Group module
}

module "module_example_KEY_PAIR" {
  source             = "./KEY_PAIR"

  KEY_NAME = "${var.INSTANCE_KEY_NAME}"
  PUBLIC_KEY = "${var.PATH_TO_PUBLIC_KEY}"
}
