output "EC2-instance-ip" {
  value = aws_eip.EC2_IP_address.public_ip
}

# output "ns-servers" {
#   value = aws_route53_zone.domain_zone.name_servers
# }

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}