output "ec2_instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.web.id
}
