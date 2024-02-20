variable "ami" {
  type    = string
  # Example default value: "ami-1234567890abcdef0"
}

variable "instance_type" {
  type    = string
  # Example default value: "t2.micro"
}

variable "security_group_id" {
  type    = string
  # No default value as it will be provided by the security group module output
}

variable "iam_instance_profile_arn" {
  type    = string
  # Example default value: "arn:aws:iam::123456789012:instance-profile/my-instance-profile"
}

variable "hola" {
  type    = string
  # Example default value: "MyEC2Instance"
}
