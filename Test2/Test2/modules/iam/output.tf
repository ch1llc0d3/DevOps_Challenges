# output "iam_instance_profile_arn" {
#   description = "ARN of the created IAM instance profile"
#   value       = aws_iam_instance_profile.instance_profile.arn
# }

# output "iam_instance_profile_name" {
#   description = "Name of the created IAM instance profile"
#   value       = aws_iam_instance_profile.instance_profile.name
# }

output "iam_instance_profile_arn" {
  value       = aws_iam_instance_profile.instance_profile[*].arn
}

output "iam_instance_profile_name" {
  value       = aws_iam_instance_profile.instance_profile[*].name
}


output "aws_iam_instance_profile" {
  description = "type of aws iam instance profile"
  value       = aws_iam_instance_profile.instance_profile
}
output "aws_iam_policy_document" {
  description = "IAM policy document"
  value       = data.aws_iam_policy_document.task_role_assume_policy.json
}

