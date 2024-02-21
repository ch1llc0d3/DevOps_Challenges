variable "ami" {
  description = "ami "
  type        = string
  default     = "ami-12345667"
}

variable "instance_type" {
  description = "instance type "
  type        = string
  default     = "t3.micro"
}

variable "security_groups" {
  description = " security_groups = [ aws_security_group.sec_group.id ] "
  type        = string
}

variable "iam_instance_profile" {
  description = " iam_instance_profile = aws_iam_instance_profile.instance_profle.arn "
  type        = string
}

variable "hola" {
  description = "name "
  type        = string
  default     = "HelloWorld"
}

variable "aws_iam_instance_profile" {
}

