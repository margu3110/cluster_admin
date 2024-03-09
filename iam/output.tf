output "instance_profile" {
    description = "Id for the ec2 sg"
    value = aws_iam_instance_profile.ec2_instance_profile.id
}
