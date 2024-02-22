# main.tf

# Virtual Private Cloud (VPC):
# Create a VPC with a CIDR block of your choice.
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Include two public subnets and two private subnets.
# Public subnets
resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidrs[count.index]
}

# Private subnets
resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidrs[count.index]
}

# Configure appropriate route tables and associations.
# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_associations" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate private subnets with the public route table
resource "aws_route_table_association" "private_subnet_associations" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}