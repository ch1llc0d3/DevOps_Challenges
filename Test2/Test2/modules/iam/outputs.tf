output "iam_role_arn" {
  value = aws_iam_role.task_role.arn
}

output "iam_instance_profile_arn" {
  value = aws_iam_instance_profile.instance_profile.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.task_role_policy.arn
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.instance_profile

}