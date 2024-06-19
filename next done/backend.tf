terraform {
  backend "s3" {
    bucket = "bucketname" #update after creation of bucket
    region = "ap-south-1"
    key = "terraform.tfstate"
    dynamodb_table = "tablename" #update after creation of table
  }
}