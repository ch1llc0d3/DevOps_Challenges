output "route_table_id" {
  description = "ID of the created route table."
  value       = aws_route_table.public_route_table.id
}
output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.my_vpc.id
}

output "vpc_cidr_block_output" {
  description = "The CIDR block of the VPC."
  value       = var.vpc_cidr_block
}

output "internet_gateway_id_output" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.my_igw.id
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = aws_vpc.my_vpc.cidr_block
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.my_igw.id
}
