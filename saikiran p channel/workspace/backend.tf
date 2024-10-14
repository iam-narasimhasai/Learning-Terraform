terraform {
  backend "s3" {
    bucket = "backendterraforms3"
    key    = "baseinfra.tfstate"
    dynamodb_table = "Dynamodb-state-locking"
    region = "ap-south-1"

  }
}



provider "random" {
  # Configuration options
}