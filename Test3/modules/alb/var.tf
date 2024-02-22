variable "alb_name" {
  description = "Name of the Application Load Balancer (ALB)"
  type        = string
}

variable "internal" {
  description = "Whether the ALB is internal (true/false)"
  type        = bool
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}
