# Set up AWS provider
provider "aws" {
  region  = var.aws_region  
  # profile = "ecs-dev"  # Uncomment and update with your AWS profile if using named profiles
}

# Include IAM module
module "iam" {
  source = "./modules/iam"

  ecs_task_role_name         = "ecs-task-role"
  ecs_task_policy_name       = "ecs-task-policy"
  ecs_instance_profile_name  = "ecs-instance-profile"
}

# Include security group module
module "security_group" {
  source = "./modules/security_group"

  vpc_id = var.vpc_id  # Update with your VPC ID
}

# Define EC2 instance
resource "aws_instance" "web" {
  ami                    = var.ami  # Update with your desired AMI
  instance_type          = var.instance_type  # Update with your desired instance type
  security_groups        = [module.security_group.security_group_id]  # Reference security group output from the module
  iam_instance_profile   = module.iam.iam_instance_profile_arn  # Reference IAM instance profile output from the module

  tags = {
    Name = "HelloWorld"
  }
}
