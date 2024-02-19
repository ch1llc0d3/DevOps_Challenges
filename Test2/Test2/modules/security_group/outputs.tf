#   security_groups = [ aws_security_group.sg.id ]
# resource "aws_security_group" "sg" {}
output "aws_security_group" {
    value = aws_security_group.sg
}

output "security_groups" {
    value = aws_security_group.sg.id
}
