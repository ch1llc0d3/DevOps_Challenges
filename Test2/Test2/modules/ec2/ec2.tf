resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  # security_groups = [ aws_security_group.sec_group.id ]
  # security_groups = [ aws_security_group.sg.id ]
  security_groups = [var.security_groups]
  # iam_instance_profile = aws_iam_instance_profile.instance_profile.arn
  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = var.hola
  }
}