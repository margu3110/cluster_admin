#!/bin/bash
# some housekeeping
sudo yum update
sudo yum install -y wget unzip
# install terraform
wget https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_amd64.zip
unzip ./terraform_1.7.2_linux_amd64.zip
sudo mv terraform /usr/local/bin
terraform –v
# install git
sudo yum install git -y
# install aws-cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# install kubectl
su - ec2-user -c 'cd ~;curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.0/2024-01-04/bin/linux/amd64/kubectl'
su - ec2-user -c 'cd ~;chmod +x ./kubectl;mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH'
# install eksctl
su - ec2-user -c 'cd ~;curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp'
sudo mv /tmp/eksctl /usr/local/bin
# clone the repo and initialize terraform
su - ec2-user -c 'cd ~;git clone https://github.com/margu3110/clusterlab1.git; cd clusterlab1; terraform init'