resource "aws_security_group" "sgone" {
  name = "Security group for ec2"


  tags = {
    Name = "SG2"
  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {

      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

output "aws_security_groupdetails" {
  value = aws_security_group.sgone.id
}

# resource "aws_security_group" "sgg1" {

# }