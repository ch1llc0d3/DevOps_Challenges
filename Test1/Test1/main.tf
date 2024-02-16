provider "aws" {
}

module "ec2" {
    source = "./modules/ec2"
    aws_security_group = var.aws_security_group.id
    security_groups = var.aws_security_group
}

module "sec_group" {
    source = "./modules/sec_group"
}

output "ec2" {
    value = var.aws_security_group.sg.id
}