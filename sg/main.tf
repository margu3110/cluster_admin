locals {
    jenkins_ports = [22]
}

### Create security Group
resource "aws_security_group" "deployer-sg" {
  name        = "deployer security group"
  description = "Allow access to port 22"
  vpc_id      = var.vpc_id

   dynamic "ingress" {
    for_each = local.jenkins_ports
    content {
    from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "deployer-sg"
    appName = var.appName
  }
}
