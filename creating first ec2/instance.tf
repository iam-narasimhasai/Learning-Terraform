resource "aws_key_pair" "key1" {
  
  key_name = "key1"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "one" {
  ami = "ami-00fa32593b478ad6e"
  key_name = "${aws_key_pair.key1.key_name}"
  user_data = file("${path.module}/file1.txt")
  instance_type = "t2.micro"
  
  tags = {
    env= "Dev"
  }
}