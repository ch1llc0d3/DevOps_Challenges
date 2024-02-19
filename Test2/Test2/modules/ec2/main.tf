resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  # security_groups = [ aws_security_group.sec_group.id ]
  security_groups = var.aws_security_group.sg.id
  # iam_instance_profile = aws_iam_instance_profile.instance_profle.arn
  iam_instance_profile = var.aws_iam_instance_profile.instance_profle.arn

  tags = {
    Name = "HelloWorld"
  }
}