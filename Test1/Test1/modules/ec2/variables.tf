variable "ami_id" {
    description = "ami id"
    type    = string
    default = "ami-12345678"
}

variable "instance_type" {
    description = "instance_type"
    type    = string
    default = "t3.micro"
}

variable "iam_instance_profile" {
    description = "iam instance profile"
    type    = string
    default = "rn:aws:iam::123456789012:instance-profile/ecsInstanceRole"
}

variable "Hello" {
    description = "just saying hello"
    type = string
    default = "HelloWorld"
}

#   security_groups = [ aws_security_group.sec_group.id ]

variable "security_groups" {
    description = "id output from sec_group"
    type = string
}

