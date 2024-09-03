terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.58.0"
    }
  }
  backend "s3" {
    bucket = "backendterraforms3"
    key    = "rds_tf_state/terraform.tfstate"
    region = "ap-south-1"
  }

}
provider "aws" {
  region = "us-east-1"
}