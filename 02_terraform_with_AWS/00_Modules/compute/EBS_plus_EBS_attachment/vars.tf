# EBS Volume Variables
variable "availability_zone" {
  description = "The AZ where the EBS volume will exist"
}

variable "size" {
  description = "(Optional) The size of the drive in GiBs."
  default     = "8"
}

variable "type" {
  description = "(Optional) The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'sc1' or 'st1' (Default: 'standard')"
}

variable "volume_tag_name" {
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = "Extra EBS Volume"
}

# EBS Volume Attachement Variables
variable "device_name" {
  description = "(Required) The device name to expose to the instance (for example, /dev/sdh or xvdh)"
}

variable "instance_id" {
  description = "(Required) ID of the Instance to attach to"
}

variable "volume_id" {
  description = "(Required) ID of the Volume to be attached"
}

variable "force_detach" {
  # (Optional, Boolean) Set to true if you want to force the volume to detach.
  #                     Useful if previous attempts failed, but use this option only as a last resort
  #                     This can result in data loss.
}
