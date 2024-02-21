output "public_subnets" {
  description = "List of IDs of the created public subnets."
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnets" {
  description = "List of IDs of the created private subnets."
  value       = aws_subnet.private_subnet[*].id
}
