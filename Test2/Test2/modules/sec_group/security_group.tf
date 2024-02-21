resource "aws_security_group" "sg" {
  name        = "My Security Group"
  description = "Basic security group for my VPC."
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  # Other ingress and egress rules...

  # dynamic "ingress_rule" {
  #   for_each = var.additional_ingress_rules

  #   content {
  #     from_port   = ingress_rule.value.from_port
  #     to_port     = ingress_rule.value.to_port
  #     protocol    = ingress_rule.value.protocol
  #     cidr_blocks = ingress_rule.value.cidr_blocks
  #   }
  # }
  tags = {
    Name        = "My security group"
    Environment = "Dev"
  }
}
