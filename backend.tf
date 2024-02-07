terraform {
    backend "s3" {
        profile = "terraform-elrond"
        key = "terraform_deployer/tfstate.tfstate"
        bucket = "marcelo-tftate-backup-deployer-2024"
        region = "us-east-1"
    }
}