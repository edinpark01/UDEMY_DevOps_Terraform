output "VPC_ID" {
  value = "${module.vpc.vpc-id}"
}

output "PUBLIC_SUBNET_ID" {
  value = "${module.subnet-public-1.subnet-id}"
}
