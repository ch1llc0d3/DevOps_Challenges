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

}