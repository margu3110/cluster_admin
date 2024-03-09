output "deployer_sg_id" {
    description = "Id for the deployer sg"
    value = aws_security_group.deployer-sg.id
}
