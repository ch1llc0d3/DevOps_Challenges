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

#   security_groups = [ aws_security_group.sec_group.id ]

variable "security_groups" {
    description = "id output from sec_group"
    type = string
    default = "arn:aws:iam::123456789012:instance-profile/ecsInstanceRole"
}

security_groups = [ aws_security_group.sec_group.id ]

