variable "ecs_task_role_name" {
  description = "Name of the ECS task role"
  default     = "ecs-task-role"
}

variable "ecs_task_policy_name" {
  description = "Name of the ECS task policy"
  default     = "ecs-task-policy"
}

variable "instance_profile_name" {
  description = "Name of the ECS instance profile"
  default     = "ecs-instance-profile"
}

variable "environment_tag" {
  description = "Tag for environment"
  default     = "Stage"
}

variable "policy_description" {
  description = "Description of the ECS task policy"
  default     = "Custom Policy for Stage"
}

variable "instance_profile_tag_name" {
  description = "Tag name for the ECS instance profile"
  default     = "ecs-instance-profile-Test"
}

variable "instance_p_tag" {
  description = "Tag for environment for the ECS instance profile"
  default     = "Test"
}

variable "instance_instance_prof_test" {
  default = "ecs-instance-profile-Test"
}

variable "arn_awn_secrets" {
  default = "arn:aws::secrets:123123123:secrets:"
}