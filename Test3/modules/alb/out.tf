output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer (ALB)"
  value       = aws_lb.my_alb.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer (ALB)"
  value       = aws_lb.my_alb.zone_id
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer (ALB)"
  value       = aws_lb.my_alb.arn
}

output "target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.my_target_group.arn
}
