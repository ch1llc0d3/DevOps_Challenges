resource "aws_lb" "my_alb" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = "application"
  subnets            = var.subnets
}

# Define ALB Listener to listen on port 80
resource "aws_lb_listener" "http_listener" {
  for_each = aws_lb_target_group.my_target_group

  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = each.value.arn
  }
}


# Define ALB Target Group
resource "aws_lb_target_group" "my_target_group" {
  for_each = var.target_groups

  name     = each.value.name_prefix
  port     = each.value.port
  protocol = each.value.protocol
  vpc_id   = var.vpc_id

  # Define health check configurations
  dynamic "health_check" {
    for_each = var.health_check_configurations

    content {
      enabled             = true
      interval            = 30
      path                = "/"
      port                = health_check.value.port
      protocol            = health_check.value.protocol
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
    }
  }
}
