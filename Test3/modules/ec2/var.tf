# variable "private_subnets" {
#   description = "List of IDs of the private subnets where EC2 instances will be launched."
#   type        = list(string)
# }

variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-12345678"
}

variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]  # Default CIDR blocks for private subnets
}