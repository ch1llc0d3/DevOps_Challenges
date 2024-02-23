# variables.tf

variable "alb_security_group_name" {
  description = "Name of the ALB security group."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB security group will be created."
  type        = string
}
