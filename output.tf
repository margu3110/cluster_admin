output "PrivateIp_Instance" {
    value = module.ec2.ec2_private_ip
}

output "PublicIp_Instance" {
    value = module.ec2.ec2_public_ip
}

output "account_id" {
    value = data.aws_caller_identity.current.account_id
}