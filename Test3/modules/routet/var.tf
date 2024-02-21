variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets associated with the route table."
  type        = number
}

variable "public_subnets" {
  description = "List of IDs of the public subnets."
  type        = list(string)
}
