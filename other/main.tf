resource "aws_instance" "name" {
  ami           = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }

  tags = {
    Name = "sample server"
  }
}