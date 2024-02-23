# out.tf

output "instance_security_group_id" {
  description = "The ID of the security group for EC2 instances."
  value       = aws_security_group.instance_sg.id
}


output "instance_security_group_name" {
  description = "security group name"
  value = aws_security_group.instance_sg.name
}