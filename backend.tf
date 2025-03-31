terraform {
  backend "s3" {
    bucket = "ok-w7-terraform-statebucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
