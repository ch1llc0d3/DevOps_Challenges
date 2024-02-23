# main.tf

# Define security group for the ALB
resource "aws_security_group" "alb_sg" {
  name        = var.alb_security_group_name
  description = "Security group for the ALB."
  vpc_id      = var.vpc_id

  # Define your security group rules here...
}
