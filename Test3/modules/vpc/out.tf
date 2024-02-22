output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.my_vpc.id
}
# output "private_subnet_ids" {
#   description = "IDs of the private subnets"
#   value       = aws_subnet.private_subnets[*].id
# }

output "public_subnet_ids" {
  description = "List of IDs of the created public subnets."
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "private_subnet_ids" {
  description = "List of IDs of the created private subnets."
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}