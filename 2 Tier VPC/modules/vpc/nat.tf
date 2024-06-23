
resource "aws_eip" "NAT1" {
  
  tags = {
    Name = "EIP 1"
  }
}

resource "aws_eip" "NAT2" {
  
  tags = {
    Name = "EIP 2"
  }
}
resource "aws_nat_gateway" "aws_nat_gateway1" {
    subnet_id = aws_subnet.pubsub_1a.id
    allocation_id = aws_eip.NAT1.id

    tags = {
      Name = "NAT1"
    }
  
  depends_on = [ aws_internet_gateway.aws_internet_gateway ]
}
resource "aws_nat_gateway" "aws_nat_gateway2" {
    subnet_id = aws_subnet.pubsub_2a.id
    allocation_id = aws_eip.NAT2.id
  tags = {
      Name = "NAT2"
    }
  depends_on = [ aws_internet_gateway.aws_internet_gateway ]

}

