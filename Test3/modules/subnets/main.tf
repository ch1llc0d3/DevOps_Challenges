resource "aws_subnet" "public_subnet" {
  count                   = var.subnet_count
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  count      = var.subnet_count
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + var.subnet_count)
}
