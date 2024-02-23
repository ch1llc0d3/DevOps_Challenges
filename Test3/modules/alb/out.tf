output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer (ALB)"
  value       = aws_lb.my_alb.dns_name
}

