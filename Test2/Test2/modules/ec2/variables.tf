
variable "ami" {
    type    = string
    default = "ami-12345667"
}

variable "instance_type" {
    type    = string
    default = "t3.micro"
}

variable "security_group_id" {
    type = string
}

variable "iam_instance_profile_arn" {
    type = string
}

variable "iam_instance_profile" {
    type = string
  
}
variable "hola" {
    type = string
    default = "HelloWorld"
  
}

variable "aws_security_group" {
    type = string
}

variable "security_groups" {
  type = string
}