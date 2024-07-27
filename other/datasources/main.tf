data "aws_ami" "name" {
  filter {
    name = "name"
    values = [ "al2023-ami-2023.5.2024*" ]
  }
  owners = ["amazon"]
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
}

data "aws_security_group" "name" {
 tags = {
   Name = "allaccess"
 }
}
data "aws_vpc" "name" {
  tags = {
    vpc = "main"
  }
}
data "aws_subnet" "name" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "publicsubnet"
  }
}
resource "aws_instance" "ec2" {
 
  ami = data.aws_ami.name.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [data.aws_security_group.name.id]
}
output "name" {
  value = data.aws_ami.name.id
}
output "two" {
  value = data.aws_security_group.name.id
}
output "three" {
  value = data.aws_vpc.name.id
}