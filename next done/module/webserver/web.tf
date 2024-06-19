resource "aws_instance" "web" {

  ami                    = var.imageid
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = ["${aws_security_group.sgone.id}"]

}