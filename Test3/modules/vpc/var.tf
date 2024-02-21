variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
  default = "MY vpc"
}
