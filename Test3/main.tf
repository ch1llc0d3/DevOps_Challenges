# Module for creating the VPC with subnets and routing tables
module "vpc" {
  source               = "./modules/vpc"
  vpc_id               = "your_existing_vpc_id_here"
  vpc_cidr_block       = "10.0.0.0/16"
  vpc_name             = "my_vpc"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Module for creating EC2 instances
module "ec2" {
  source = "./modules/ec2"
  # Pass any required variables for the EC2 module
}

# Module for creating security groups
module "security" {
  source                       = "./modules/security"
  alb_security_group_id        = module.security.alb_security_group_id # Provide the ALB security group ID here
  instance_security_group_name = "example-instance-sg"
  vpc_id                       = module.vpc.vpc_id
}

# Module for creating the Application Load Balancer (ALB)
# module "alb" {
#   source   = "./modules/alb"
#   alb_name = "my-alb"
#   internal = false
#   # subnets             = ["subnet-123456", "subnet-654321"]
#   subnets = module.vpc.public_subnet_ids
#   # security_group_ids  = ["sg-abcdef1234567890"]
#   security_group_id = module.security.alb_security_group_id
#   # target_group_name   = "my-target-group"
#   target_group_name = "my-target-group"
#   # vpc_id              = "vpc-123456789"
#   vpc_id = module.vpc.vpc_id
# }

module "alb" {
  source = "./modules/alb"

  name               = "my-alb"
  vpc_id             = "vpc-abcde012"
  subnets            = ["subnet-abcde012", "subnet-bcde012a"]
  internal           = false
  target_groups = {
    ex-instance = {
      name_prefix      = "h1"
      protocol         = "HTTP"
      port             = 80
      target_type      = "instance"
    }
  }

  health_check_configurations = [
    {
      port     = 80
      protocol = "HTTP"
    }
  ]

  tags = {
    Environment = "Development"
    Project     = "Example"
  }
}




