resource "aws_security_group" "sg" {
  name        = "My Security Group"
  description = "Basic security group for my VPC."
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["192.168.1.0/24", "192.168.2.0/24"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "My security group"
    Environment = "Dev"
  }
}