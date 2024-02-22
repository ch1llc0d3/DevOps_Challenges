# out.tf

output "instance_security_group_id" {
  description = "The ID of the security group for EC2 instances."
  value       = aws_security_group.instance_sg.id
}
output "alb_security_group_id" {
  description = "ID of the security group for the ALB."
  value       = aws_security_group.alb_sg.id  # Replace 'alb_sg' with the appropriate name of your ALB security group resource
}
