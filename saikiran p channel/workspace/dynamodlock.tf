#dont use
# resource "aws_dynamodb_table" "state_locking" {
#   hash_key = "LockID"
#   name = "Dynamodb-state-locking"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   billing_mode = "PAY_PER_REQUEST"
# } dont use