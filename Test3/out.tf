output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer (ALB)"
  value       = module.alb.alb_dns_name
}
