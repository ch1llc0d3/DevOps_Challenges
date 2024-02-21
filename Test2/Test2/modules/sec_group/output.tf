# security_groups = [ aws_security_group.sec_group.id ]
output "security_groups" {
  value = aws_security_group.sg.id
}
