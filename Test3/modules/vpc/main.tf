# Virtual Private Cloud (VPC):
# Create a VPC with a CIDR block of your choice.
resource "aws_vpc" "my_vpc" {
  cidr_block             = var.vpc_cidr_block
  instance_tenancy       = "default"
  enable_dns_hostnames   = true

  tags = {
    Name = var.vpc_name
  }
}

# Include two public subnets and two private subnets.
# Public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}

# Private subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
}

# Private subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
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
resource "aws_route_table_association" "pubs_1_a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "pubs_2_a" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# Associate private subnets with the public route table
resource "aws_route_table_association" "privs_1_a" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "privs_2_a" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnet_cidrs)
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]
}

resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet_cidrs[count.index]
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets."
  value       = aws_subnet.public_subnets[*].id
}