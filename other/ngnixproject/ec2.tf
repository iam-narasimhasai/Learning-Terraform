resource "aws_instance" "ec2" {
  vpc_security_group_ids = [ aws_security_group.ngnix.id ]
  ami = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  user_data = <<-EOF
    sudo yum install -y nginx
    sudo systemctl start nginx
  EOF

}
resource "aws_security_group" "ngnix" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
