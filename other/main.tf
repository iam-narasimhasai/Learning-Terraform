locals {
  name  = "myserver"
  owner = "abc"
  tags = {
    Name = "instance"
  }
}


resource "aws_instance" "name" {
  ami           = "ami-0427090fd1714168b"
  instance_type = var.instance_type
  root_block_device {
    volume_size = var.root_config.volume_size
    volume_type = var.root_config.volume_type
  }
  // tags = local.tags

  tags = merge(var.instance_tags,
    {
      Name = local.name,

  })


}