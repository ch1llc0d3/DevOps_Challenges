module "ec2" {
  source = "./modules/ec2"  # Path to your ec2 module directory

  # ami_id                = var.ami
  # instance_type         = var.instance_type
  # iam_instance_profile  = var.iam_instance_profile
  # Hello                 = var.hola
  # modulo.nombre del module en el main. nombre del output
  # security_groups       = module.sec_group.security_group_id
  security_groups = module.sec_group.security_group_id
  }

module "sec_group" {
  source = "./modules/sec_group"
  # Define any required variables for the security_group module here
}

