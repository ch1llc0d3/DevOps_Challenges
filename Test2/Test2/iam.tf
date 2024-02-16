resource "aws_iam_role" "task_role" {
  name = "ecs-task-role"
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
  name = "ecs-task-policy"
  description = "Custom Policy for Stage"
  path = "/"
  policy = data.aws_iam_policy_document.baf_ecs_task_role_permissions.json
}

data "aws_iam_policy_document" "task_role_permissions" {
  statement {
    actions = [ 
      "polly:*"
     ]
    resources = [ 
      "*"
     ]
    effect = "Allow"
  }

  statement {
    actions = [ 
      "s3:*"
     ]
    resources = [ 
      "*"
     ]
    effect = "Allow"
  }

  statement {
    actions = [ 
      "sns:*"
     ]
    resources = [ 
      "*"
     ]
    effect = "Allow"
  }

  statement {
    actions = [ 
      "textract:DetectDocumentText"
     ]
    resources = [ 
      "*"
     ]
    effect = "Allow"
  }

  statement {
    actions = [ 
      "transcribe:StartTranscriptionJob",
      "transcribe:GetTranscriptionJob"
     ]
    resources = [ 
      "*"
     ]
    effect = "Allow"
  }

  statement {
    actions = [ 
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
      "kms:Sign"
     ]
    resources = [ 
      "*"
     ]
    effect = "Allow"
  }

  statement {
    actions = [ 
      "secretsmanager:GetSecretValue"
     ]
    resources = [ 
      "arn:aws::secrets:123123123:secrets:"
     ]
  }

}

resource "aws_iam_role_policy_attachment" "task_role_att_1" {
  role = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_role_policy.arn
}

resource "aws_iam_instance_profile" "instance_profle" {
  name = "ecs-instance-profile"
  role = aws_iam_role.task_role.name
  tags = {
    Name = "ecs-instance-profile-Test"
    Environment= "Test"
  }
}