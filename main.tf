# main.tf


module "security_group" {
  source = "./modules/sec_group"
}

module "ec2_instance" {
  source = "./modules/ec2"
  aws_security_group = var.aws_security_group
  security_group_id = var.security_group_id
}

output "ec2" {
  value = ec2_instance
}