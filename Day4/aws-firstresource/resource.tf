resource "aws_key_pair" "key-tf" {
  key_name   = "ssh-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "web" {
  ami           = var.amiid
  instance_type = var.inst_type
  key_name      = aws_key_pair.key-tf.key_name

  user_data = file("${path.module}/userdata.txt")
  tags = {
    Name = "instance from terraform"
  }
  vpc_security_group_ids = ["aws_security_group.allow_tls.id"] //assigned sg to instance
}

output "keyname" {
  value = aws_key_pair.key-tf.key_name
}
output "userdata" {
  value = file("${path.module}/userdata.txt")
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tcp"
  description = "Allow tcp inbound traffic"
  

  ingress {
    description      = "ssh allow"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //SSH usually runs over TCP
  }
  ingress {
    description      = "http allow"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //HTTP is a member of the TCP/IP family
  }
  ingress {
    description      = "https allow"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    //HTTPS is a member of the TCP/IP family
  }

   
  
}
