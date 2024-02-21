module "ec2" {
  source                   = "./modules/ec2"
  # aws_iam_instance_profile = [module.iam.aws_iam_instance_profile]
  # aws_iam_instance_profile = module.iam.iam_instance_profile_arn  # 1st ARN
  aws_iam_instance_profile = length(module.iam.aws_iam_instance_profile) > 0 ? module.iam.aws_iam_instance_profile[0] : null
  # iam_instance_profile     = module.iam.iam_instance_profile_arn
  #  iam_instance_profile     = module.iam.iam_instance_profile_arn[0] # 1st ARN this one works when create_instance.. is true
  iam_instance_profile     = length(module.iam.iam_instance_profile_arn) > 0 ? module.iam.iam_instance_profile_arn[0] : null

  security_groups          = module.sec_group.security_groups

}

module "iam" {
  source = "./modules/iam"
  iam_policy_statements = [
    {
      actions = ["s3:GetObject"]
      resources = ["arn:aws:s3:::my-bucket/*"]
      effect = "Allow"
    },
    {
      actions = ["s3:PutObject"]
      resources = ["arn:aws:s3:::my-bucket/upload/*"]
      effect = "Allow"
    },
  ]
  # create_instance_profile = true # everything ok with this true
  create_instance_profile = false # need to change the conditional for this one in the iam_instance_profile
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
