
//creating key 
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/id_rsa.pub")
}

# output "keynames" {
#   value = "${aws_key_pair.deployer.public_key}"
# }