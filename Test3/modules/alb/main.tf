# Define the Application Load Balancer (ALB)
resource "aws_lb" "my_alb" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"

  subnets         = var.subnets
  security_groups = [var.security_group_id]

  tags = {
    Name = var.alb_name
  }
}

# Define the ALB listener to listen on port 80
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# Define the ALB target group
# resource "aws_lb_target_group" "my_target_group" {
#   name     = var.target_group_name
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id

#   health_check {
#     enabled             = true
#     interval            = 30
#     path                = "/"
#     port                = 80
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     matcher             = "200-399"
#   }
# }

resource "aws_lb_target_group" "my_target_group" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}