# Remove or rename one of the outputs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private_subnets[*].id
}
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}
