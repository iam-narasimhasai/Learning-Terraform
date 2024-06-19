terraform { //should not use any variable
  required_version = "1.8.4"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}