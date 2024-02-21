resource "aws_iam_role" "task_role" {
  name = var.ecs_task_role_name
  tags = {
    Environment = "Stage"
  }
  assume_role_policy = data.aws_iam_policy_document.task_role_assume_policy.json
}

data "aws_iam_policy_document" "task_role_assume_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_policy" "task_role_policy" {
  name        = var.ecs_task_policy_name
  description = "Custom Policy for Stage"
  path        = "/"
  # Needs to be declared
  policy = data.aws_iam_policy_document.baf_ecs_task_role_permissions.json
}

# data "aws_iam_policy_document" "baf_ecs_task_role_permissions" {
#   statement {
#     actions = [
#       "polly:*",
#       "s3:*",
#       "sns:*",
#       "textract:DetectDocumentText",
#       "transcribe:StartTranscriptionJob",
#       "transcribe:GetTranscriptionJob",
#       "kms:GetPublicKey",
#       "kms:Decrypt",
#       "kms:ListKeyPolicies",
#       "kms:UntagResource",
#       "kms:ListRetirableGrants",
#       "kms:GetKeyPolicy",
#       "kms:Verify",
#       "kms:ListResourceTags",
#       "kms:ListGrants",
#       "kms:GetParametersForImport",
#       "kms:DescribeCustomKeyStores",
#       "kms:ListKeys",
#       "kms:TagResource",
#       "kms:Encrypt",
#       "kms:GetKeyRotationStatus",
#       "kms:ListAliases",
#       "kms:GenerateDataKey",
#       "kms:DescribeKey",
#       "kms:Sign",
#       "secretsmanager:GetSecretValue" 
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }
# }

data "aws_iam_policy_document" "baf_ecs_task_role_permissions" {
  dynamic "statement" {
    for_each = var.iam_policy_statements

    content {
      actions   = statement.value.actions
      resources = statement.value.resources
      effect    = statement.value.effect
    }
  }
}

data "aws_iam_policy_document" "task_role_permissions" {
  dynamic "statement" {
    for_each = var.task_role_permissions_statements

    content {
      actions   = statement.value.actions
      resources = statement.value.resources
      effect    = statement.value.effect
    }
  }
}

# data "aws_iam_policy_document" "task_role_permissions" {
#   statement {
#     actions = [
#       "polly:*"
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }

#   statement {
#     actions = [
#       "s3:*"
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }

#   statement {
#     actions = [
#       "sns:*"
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }

#   statement {
#     actions = [
#       "textract:DetectDocumentText"
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }

#   statement {
#     actions = [
#       "transcribe:StartTranscriptionJob",
#       "transcribe:GetTranscriptionJob"
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }

#   statement {
#     actions = [
#       "kms:GetPublicKey",
#       "kms:Decrypt",
#       "kms:ListKeyPolicies",
#       "kms:UntagResource",
#       "kms:ListRetirableGrants",
#       "kms:GetKeyPolicy",
#       "kms:Verify",
#       "kms:ListResourceTags",
#       "kms:ListGrants",
#       "kms:GetParametersForImport",
#       "kms:DescribeCustomKeyStores",
#       "kms:ListKeys",
#       "kms:TagResource",
#       "kms:Encrypt",
#       "kms:GetKeyRotationStatus",
#       "kms:ListAliases",
#       "kms:GenerateDataKey",
#       "kms:DescribeKey",
#       "kms:Sign"
#     ]
#     resources = [
#       "*"
#     ]
#     effect = "Allow"
#   }

#   statement {
#     actions = [
#       "secretsmanager:GetSecretValue"
#     ]
#     resources = [
#       var.arn_awn_secrets
#     ]
#   }

# }

resource "aws_iam_role_policy_attachment" "task_role_att_1" {
  role       = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_role_policy.arn
}

resource "aws_iam_instance_profile" "instance_profile" {
  count = var.create_instance_profile ? 1 : 0
  name = var.instance_profile_name
  role = aws_iam_role.task_role.name
  tags = {
    Name        = var.instance_instance_prof_test
    Environment = var.instance_p_tag
  }
}