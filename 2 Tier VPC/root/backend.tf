# terraform {
#   backend "s3" {
#     bucket         = "backendterraforms3"
#     key            = "backendterraforms3/abc.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "dynamoforterraform"
#   }
# }