variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIs" {
  type = "map"

  default = {
    us-east-1 = "ami-0ac019f4fcb7cb7e6"
    us-west-2 = "ami-0f65671a86f061fcd"
  }
}
