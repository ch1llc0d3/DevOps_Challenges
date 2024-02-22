
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name       = "my_vpc"
}

module "subs" {
  source               = "./modules/subs"
  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "route_s" {
  source            = "./modules/route_s"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.subs.public_subnet_ids
}