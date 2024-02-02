output "subnet_id" {
  value = aws_subnet.demotestsub.id
}

output "security_group_id" {
  value = aws_security_group.demotestsg.id
}