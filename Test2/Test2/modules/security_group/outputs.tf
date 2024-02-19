#   security_groups = [ aws_security_group.sec_group.id ]
# resource "aws_security_group" "sg" {}
output "aws_security_group" {
    value = aws_security_group.sg
}

output "security_groups" {
    value = aws_security_group.sg.id
}
#   iam_instance_profile = aws_iam_instance_profile.instance_profle.arn
