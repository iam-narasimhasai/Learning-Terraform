
//creating key 
 resource "aws_key_pair" "deployer" {
   key_name   = "deployer-key"
   public_key = file("${path.module}/id_rsa.pub")
 }

# output "keynames" {
#   value = "${aws_key_pair.deployer.public_key}"
# }
 resource "aws_instance" "web1" {

   ami           = "ami-00fa32593b478ad6e"
   instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
   vpc_security_group_ids = [aws_security_group.sgone.id]


   tags = {
     Name = "first tf instance"
   }
 }
 