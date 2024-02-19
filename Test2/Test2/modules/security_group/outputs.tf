output "security_group_id" {
  value = aws_security_group.sg.id #ussar
}

output "security_group_name" {
  value = aws_security_group.sg.name
}

output "security_group_description" {
  value = aws_security_group.sg.description
}

output "aws_security_group" {
  value = aws_security_group.sg
}
