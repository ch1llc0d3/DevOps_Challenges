variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create (public and private)."
  type        = number
}
