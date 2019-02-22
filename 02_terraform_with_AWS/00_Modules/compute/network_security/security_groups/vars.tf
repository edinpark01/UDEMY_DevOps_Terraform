variable "vpc_id" {}

variable "name" {}
variable "description" {}

# INGRESS variables
variable "ing_from_port" {}
variable "ing_to_port" {}
variable "ing_protocol" {}
variable "ing_cidr_blocs" {}

# EGRESS variables
variable "eg_from_port" {}
variable "eg_to_port" {}
variable "eg_protocol" {}
variable "eg_cidr_blocs" {}

# Tags
variable "security_group_tag_name" {}
