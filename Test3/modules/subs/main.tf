resource "aws_subnet" "public_subnets" {
  count     = length(var.public_subnet_cidrs)
  vpc_id    = var.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]
}

resource "aws_subnet" "private_subnets" {
  count     = length(var.private_subnet_cidrs)
  vpc_id    = var.vpc_id
  cidr_block = var.private_subnet_cidrs[count.index]
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets."
  value       = aws_subnet.public_subnets[*].id
}
