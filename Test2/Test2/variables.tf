variable "ami" {
    type    = string
    # default = "your-ami-id"  # Update with your desired AMI ID
}

variable "instance_type" {
    type    = string
    # default = "t3.micro"
}

variable "vpc_id" {
    type    = string
    # default = "vpc-12345678"
}

variable "aws_region" {
    type    = string
    # default = "us-east-1"
}

variable "ecs_task_role_name" {
    type    = string
    # default = "ecs-task-role"
}

variable "ecs_task_policy_name" {
    type    = string
    # default = "ecs-task-policy"
}

variable "ecs_instance_profile_name" {
    type    = string
    # default = "ecs-instance-profile"
}

variable "hola" {
    type    = string
}
