output "web_server_instance_ids" {
  description = "IDs of the EC2 instances acting as web servers."
  value       = aws_instance.web_servers[*].id
}

output "web_server_instance_public_ips" {
  description = "Public IP addresses of the EC2 instances acting as web servers."
  value       = aws_instance.web_servers[*].public_ip
}