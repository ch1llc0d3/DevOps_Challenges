resource "aws_instance" "web" {
  ami           = "ami-12345667"
  instance_type = "t3.micro"
  security_groups = [ aws_security_group.sec_group.id ]
  iam_instance_profile = "arn:aws:iam::123456789012:instance-profile/ecsInstanceRole"

  tags = {
    Name = "HelloWorld"
  }
}