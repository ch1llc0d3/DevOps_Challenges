# Module for creating the VPC
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name       = "my_vpc"
}

# Module for creating subnets within the VPC
module "subs" {
  source               = "./modules/subs"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Module for creating routing tables and associations
module "route_s" {
  source            = "./modules/route_s"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.subs.public_subnet_ids
}

# Module for creating EC2 instances
module "ec2" {
  source = "./modules/ec2"
}

# Module for creating security groups
module "security" {
  source                       = "./modules/security"
  alb_security_group_id        = module.security.alb_security_group_id  # Provide the ALB security group ID here
  instance_security_group_name = "example-instance-sg"
  vpc_id                       = module.vpc.vpc_id
}


# Module for creating the Application Load Balancer (ALB)
module "alb" {
  source            = "./modules/alb"
  alb_name          = "my-alb"
  internal          = false
  subnets           = module.subs.public_subnet_ids
  security_group_id = module.security.alb_security_group_id
  target_group_name = "my-target-group"
  vpc_id            = module.vpc.vpc_id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer (ALB)"
  value       = module.alb.alb_dns_name
}
