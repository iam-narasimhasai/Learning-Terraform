resource "aws_vpc" "vpc" {
  cidr_block = "20.0.0.0/16"

  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = 2
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index % 2)
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index * 2)
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet-${count.index + 1}"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = 2
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index % 2)
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index * 2 + 1)
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet-${count.index + 1}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "IGW"
  }
}
resource "aws_route_table" "prt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_route_table"
  }
}
resource "aws_route_table_association" "rta1" {
  route_table_id = aws_route_table.prt.id
  count          = length(aws_subnet.public_subnet)
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
}