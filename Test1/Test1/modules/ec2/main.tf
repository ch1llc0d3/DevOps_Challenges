resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups =  [var.security_groups]
  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = var.Hello
  }
}