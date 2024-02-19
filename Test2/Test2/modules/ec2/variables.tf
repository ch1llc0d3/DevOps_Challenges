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
