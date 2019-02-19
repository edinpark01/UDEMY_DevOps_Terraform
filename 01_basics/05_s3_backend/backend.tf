terraform {
  backend "s3" {
    bucket = "terraform-tfstate-edinpark"
    key = "terraform/backend_demo"
  }
}

