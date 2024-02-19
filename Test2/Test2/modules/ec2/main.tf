resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  # security_groups = [ aws_security_group.sec_group.id ]
  # security_groups      = [module.security_group.security_group_id]
    security_groups = [var.security_group_id]
  # iam_instance_profile = aws_iam_instance_profile.instance_profle.arn
  # iam_instance_profile = var.aws_iam_instance_profile.instance_profle.arn
  iam_instance_profile = var.iam_instance_profile_arn
  tags = {
    Name = var.hola
  }
}