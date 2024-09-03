resource "random_password" "pass" {
  length = 3
  
}

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "name" {
    count = 2
    vpc_id = aws_vpc.vpc1.id
  cidr_block = cidrsubnet("10.0.0.0/24",8,count.index)
}