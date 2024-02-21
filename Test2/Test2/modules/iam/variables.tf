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

variable "iam_policy_statements" {
  description = "List of IAM policy statements"
  type = list(object({
    actions   = list(string)
    resources = list(string)
    effect    = string
  }))
  default = [
    {
      actions   = [
        "polly:*",
        "s3:*",
        "sns:*",
        "textract:DetectDocumentText",
        "transcribe:StartTranscriptionJob",
        "transcribe:GetTranscriptionJob",
        "kms:GetPublicKey",
        "kms:Decrypt",
        "kms:ListKeyPolicies",
        "kms:UntagResource",
        "kms:ListRetirableGrants",
        "kms:GetKeyPolicy",
        "kms:Verify",
        "kms:ListResourceTags",
        "kms:ListGrants",
        "kms:GetParametersForImport",
        "kms:DescribeCustomKeyStores",
        "kms:ListKeys",
        "kms:TagResource",
        "kms:Encrypt",
        "kms:GetKeyRotationStatus",
        "kms:ListAliases",
        "kms:GenerateDataKey",
        "kms:DescribeKey",
        "kms:Sign",
        "secretsmanager:GetSecretValue"
      ]
      resources = ["*"]
      effect    = "Allow"
    }
  ]
}