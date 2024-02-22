variable "vpc_id" {
  description = "ID of the VPC."
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets."
  type        = list(string)
}
