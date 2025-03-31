terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.79.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "ok-w7-terraform-statebucket"
    key    = "qa/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}