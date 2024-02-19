# AWS provider
provider "aws" {
  region  = var.aws_region
  # profile = "ecs-dev"
}

# IIAM module
module "iam" {
  source = "./modules/iam"

  # ecs_task_role_name         = "ecs-task-role"
  ecs_task_role_name = var.ecs_task_role_name
  # ecs_task_policy_name       = "ecs-task-policy"
  ecs_task_policy_name = var.ecs_task_policy_name
  # ecs_instance_profile_name  = "ecs-instance-profile"
  ecs_instance_profile_name = var.ecs_instance_profile_name
}

# security group module
module "security_group" {
  source = "./modules/security_group"

  vpc_id = var.vpc_id
}

# Define EC2 instance
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  security_groups        = [module.security_group.security_group_id]
  # security_groups = [var.security_group_id]
  iam_instance_profile   = module.iam.iam_instance_profile_arn
  # iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = var.hola
  }
}
