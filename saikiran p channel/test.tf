# resource "aws_vpc" "vpc_terraform" {
#   enable_dns_hostnames = true
#   cidr_block           = "12.0.0.0/16"

#   tags = {
#     Name = "vpc1"
#   }
# }


resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.vpc1.id
  tags = {
    Name = "igw"
  }

}

data "aws_vpc" "vpc1" {
    
  filter {
    name = "tag:Name"
    values = ["dummy"]
  }
}

output "name" {
  value = data.aws_vpc.vpc1.id
}