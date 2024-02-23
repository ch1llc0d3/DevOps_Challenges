output "security_group_id" {
  description = "ID of the created security group for EC2 instances"
  value       = aws_security_group.instance_sg.id
}
