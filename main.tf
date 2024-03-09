provider "aws" {
    region = "us-east-1"
    profile = "terraform-isildur"
}

data "aws_vpc" "default_vpc" {
  default = true
} 

#Create security group for EC2
### Security Group Module
module "ec2_sg" {
    source = "./sg"
    appName = var.appName
    vpc_id = data.aws_vpc.default_vpc.id
}

# Terraform module Block to create the iam instance profile
module "iam_instance_profile" {
  source                = "./iam"
  instance_profile_name = "instance-profile-devops"
  iam_policy_name       = "devops-policy"
  role_name             = "role_name"
}

# Terraform module Block to create EC2 (kubectl)
module "ec2" {
  source        = "./ec2"
  ec2_name      = "terraform_deployer"
  key_name      = var.key_name
  ami           = var.ami
  instance_type = var.instance_type
  vpc_sg        = module.ec2_sg.deployer_sg_id
  instance_profile = module.iam_instance_profile.instance_profile
}

output "PrivateIp_Instance" {
    value = module.ec2.ec2_private_ip
}

output "PublicIp_Instance" {
    value = module.ec2.ec2_public_ip
}

data "aws_caller_identity" "current" {}

output "account_id" {
    value = data.aws_caller_identity.current.account_id
}
 