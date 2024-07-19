
resource "random_id" "random1" {
  byte_length = 8
 
}
resource "aws_s3_bucket" "mywebapp" {
  bucket = "demo-${random_id.random1.hex}"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.mywebapp.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "name" {
  bucket = aws_s3_bucket.mywebapp.bucket
  policy = jsonencode(
    {
    "Version"= "2012-10-17",
    "Statement"= [
        {
            "Sid"= "PublicReadGetObject",
            "Effect"= "Allow",
            "Principal"= "*",
            "Action"= "s3:GetObject",
            "Resource"= "arn:aws:s3:::${aws_s3_bucket.mywebapp.id}/*"
            
        }
    ]
}
  )
}
resource "aws_s3_object" "html" {
  bucket = aws_s3_bucket.mywebapp.bucket
  source = "./index.html"
  key = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  bucket = aws_s3_bucket.mywebapp.bucket
  source = "./styles.css"
  key = "styles.css"
  content_type = "text/css"
}

resource "aws_s3_object" "js" {
  bucket = aws_s3_bucket.mywebapp.bucket
  source = "./index.js"
  key = "index.js"
  content_type = "text/js"
}


resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mywebapp.id
 
  index_document {
    suffix = "index.html"
  }
  
}



output "aws_s3_bucket" {
  value = aws_s3_bucket.mywebapp.id
}
output "aws_s3_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}

