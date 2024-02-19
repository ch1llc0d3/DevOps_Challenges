variable "ami" {
    type    = string
    default = "your-ami-id"  # Update with your desired AMI ID
}

variable "instance_type" {
    type    = string
    default = "t3.micro"
}

variable "vpc_id" {
    type    = string
    default = "vpc-12345678"
}

variable "aws_region" {
    type    = string
    default = "us-east-1"
}

# The following variables are not necessary in the root folder and should be moved to the respective module folders (iam and security_group):

# variable "security_groups" {
#     type = string
# }

# variable "aws_security_group" {
#     type = string
# }

# variable "iam_instance_profile" {
#     type = string
# }

# variable "aws_iam_instance_profile" {
#     type = string
# }
