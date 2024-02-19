variable "ami" {
    type = string
    default = "ami-12345667"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "security_groups" {
    type = string
}

variable "aws_security_group" {
    type = string
}
variable "iam_instance_profile" {
    type = string
}

variable "aws_iam_instance_profile" {
    type = string
}

variable "vpc_id" {
    type = string
    default = "vpc-12345678"
}
