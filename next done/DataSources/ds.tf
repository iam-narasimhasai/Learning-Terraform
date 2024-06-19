data "aws_ami" "AmazonLinux"{
    most_recent = true
    owners = ["137112412989"]

    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }
    
    filter {
      name = "name"
      values = ["al2023-ami-*"]
    }
}

output "amiid" {
  value = data.aws_ami.AmazonLinux.id
}