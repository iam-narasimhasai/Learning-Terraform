
resource "random_id" "random1" {
  byte_length = 8
 
}
resource "aws_s3_bucket" "demo" {
  bucket = "demo-${random_id.random1.hex}"
}
resource "aws_s3_object" "name" {
  bucket = aws_s3_bucket.demo.bucket
  source = "./myfile.txt"
  key = "okokok.txt"
}
