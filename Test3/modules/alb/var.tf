variable "name" {
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

variable "target_groups" {
  description = "Map of ALB target group configurations"
  type        = map(object({
    name_prefix   = string
    protocol      = string
    port          = number
    target_type   = string
  }))
}

variable "health_check_configurations" {
  description = "List of health check configurations for ALB target groups"
  type        = list(object({
    port     = number
    protocol = string
  }))
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}
