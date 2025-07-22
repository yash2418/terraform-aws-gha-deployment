terraform {
  backend "s3" {
    bucket = "yash-terraform-statefiles"
    key    = "sns/terraform.tfstate"
    region = "ap-south-1"
  }
}