# outputs.tf

output "alb_security_group_id" {
  description = "The ID of the ALB security group."
  value       = aws_security_group.alb_sg.id
}

output "alb_security_group_arn" {
  description = "The ARN of the ALB security group."
  value       = aws_security_group.alb_sg.arn
}

output "alb_security_group_name" {
  description = "The name of the ALB security group."
  value       = aws_security_group.alb_sg.name
}

# Add more outputs as needed
