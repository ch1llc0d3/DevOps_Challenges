resource "aws_instance" "web_servers" {
  count         = 2
  ami           = var.ami_id // Use the latest Amazon Linux 2 AMI
  instance_type = var.instance_type

  subnet_id = var.private_subnets[count.index] // Place instances in private subnets

  // Other instance configurations...
}