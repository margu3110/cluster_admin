provider "aws" {
    region = "us-east-1"
    profile = "terraform-elrond"
}

resource "aws_instance" "terraform_deployer" {
    ami = "ami-0e1d30f2c40c4c701"
    instance_type = "t2.micro"
    key_name = "elrond"
    security_groups = [aws_security_group.aws_sg.name]
    vpc_security_group_ids      = [aws_security_group.aws_sg.id]
    associate_public_ip_address = true
    user_data = file("server-script.sh")
    tags = {
        Name = "deployer"
    }
}


resource "aws_security_group" "aws_sg" {
  name = "security group from terraform"

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "80 from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


output "PrivateIp_Instance" {
    value = aws_instance.terraform_deployer.private_ip
}

output "PublicIp_Instance" {
    value = aws_instance.terraform_deployer.public_ip
}


data "aws_caller_identity" "current" {}
output "account_id" {
    value = data.aws_caller_identity.current.account_id
}
 