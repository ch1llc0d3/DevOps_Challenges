# var.tf

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "alb_security_group_id" {
  description = "The ID of the ALB security group to allow incoming traffic from."
  type        = string
}

variable "instance_security_group_name" {
  description = "The name of the security group for EC2 instances."
  type        = string
}
# var.tf

# variable "ingress_rules" {
#   description = "List of ingress rules for the security group."
#   type        = list(object({
#     from_port       = number
#     to_port         = number
#     protocol        = string
#     cidr_blocks     = list(string)
#     security_groups = list(string)
#   }))
#   default     = []
# }

# variable "egress_rules" {
#   description = "List of egress rules for the security group."
#   type        = list(object({
#     from_port       = number
#     to_port         = number
#     protocol        = string
#     cidr_blocks     = list(string)
#     security_groups = list(string)
#   }))
#   default     = []
# }
variable "ingress_rules" {
  description = "List of ingress rules for the security group."
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
  default = [
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = ["${var.alb_security_group_id}"] # Allow traffic only from ALB's security group
    }
  ]
}
variable "egress_rules" {
  description = "List of egress rules for the security group."
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = list(string)
  }))
  default = [
    {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      cidr_blocks     = ["0.0.0.0/0"] # Allow all outbound traffic
      security_groups = []
    }
  ]
}
