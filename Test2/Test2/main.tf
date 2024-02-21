module "ec2" {
  source                   = "./modules/ec2"
  aws_iam_instance_profile = [module.iam.aws_iam_instance_profile]
  iam_instance_profile     = module.iam.iam_instance_profile_arn
  security_groups          = module.sec_group.security_groups

}

module "iam" {
  source = "./modules/iam"

}


module "sec_group" {
  source = "./modules/sec_group"

  # Other variables...

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["192.168.1.0/24", "192.168.2.0/24"]
    },
    {
      from_port   = 23
      to_port     = 23
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # Add more egress rules as needed
  ]
}
