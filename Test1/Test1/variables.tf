variable "ami" {
    type = string
    default = "ami-12345667"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}
variable "hola" {
    type = string
    default = "HelloWorld"
}

variable "iam_instance_profile" {
    type = string
    default = "arn:aws:iam::123456789012:instance-profile/ecsInstanceRole"
}

security_groups = [ aws_security_group.sec_group.id ]

