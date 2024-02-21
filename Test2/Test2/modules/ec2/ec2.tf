resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  # security_groups = [ aws_security_group.sec_group.id ]
  # security_groups = [ aws_security_group.sg.id ]
  security_groups = [var.security_groups]
  # iam_instance_profile = aws_iam_instance_profile.instance_profile.arn

  tags = {
    Name = var.hola
  }

  # # Set iam_instance_profile only if it's not null
  # dynamic "iam_instance_profile" {
  #   for_each = var.iam_instance_profile != null ? [var.iam_instance_profile] : []
  #   content {
  #     arn = iam_instance_profile.value
  #   }
  # }
}