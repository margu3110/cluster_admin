terraform {
    backend "s3" {
        profile = "terraform-isildur"
        key = "terraform_deployer/tfstate.tfstate"
        bucket = "marcelo-tfstate-backend-clusterlabisildur-2024"
        region = "us-east-1"
    }
}