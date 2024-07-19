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

}
provider "aws" {
  region = "ap-south-1"
}