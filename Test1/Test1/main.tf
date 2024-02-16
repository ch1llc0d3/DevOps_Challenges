
module "aws_security_group" {
  source = "./modules/sec_group"
}

# module "sec_group" {
#   source              = "./modules/sec_group"

# }

# module "ec2" {
#   source              = "./modules/ec2"
#   aws_security_group  = module.security_groups.aws_security_group  // Pass the AWS security group module reference
#   // Ensure that security_groups variable is provided if needed by the ec2 module
#   # security_groups     = module.security_groups.security_group_id
#   security_groups = [ module.security_groups.sec_group.id ]
# }

# # Output variables if needed
# output "ec2_instance_id" {
#   value = module.aws_security_group
# }

