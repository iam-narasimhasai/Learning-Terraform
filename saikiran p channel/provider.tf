provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket         = "backendterraforms3"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"
    
  }
}