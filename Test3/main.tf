# Include VPC module
module "vpc" {
  source = "./modules/vpc"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  vpc_cidr_block = "10.0.0.0/16"
}

# Include Subnets module
module "subnets" {
  source = "./modules/subnets"
  subnet_count = 2
  vpc_id = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
}

# Include Route Table module
module "route_table" {
  source  = "./modules/routet"
  vpc_id  = module.vpc.vpc_id
  subnet_count = 2  # Assuming there are 2 public subnets
  internet_gateway_id = module.vpc.internet_gateway_id
  public_subnets = module.subnets.public_subnets
}
