resource "aws_route_table" "pub_route_table" {
  
  vpc_id = aws_vpc.twotiervpc.id
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_internet_gateway.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "pub_route_pubsub1a" {
  subnet_id = aws_subnet.pubsub_1a.id
  route_table_id = aws_route_table.pub_route_table.id
}

resource "aws_route_table_association" "pub_route_pubsub_2a" {
  subnet_id = aws_subnet.pubsub_2a.id
  route_table_id = aws_route_table.pub_route_table.id

}

# Private
resource "aws_route_table" "pri_route_prisub1a" {
  vpc_id = aws_vpc.twotiervpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.aws_nat_gateway1.id
  }

  tags = {
    Name = "privateAZ1"
  }
}


resource "aws_route_table_association" "pri_route_prisub1a" {
  subnet_id = aws_subnet.prisub_1a.id
  route_table_id = aws_route_table.pri_route_prisub1a.id
}

resource "aws_route_table_association" "pri_route_prisub2a" {
  subnet_id = aws_subnet.prisub_2a.id
  route_table_id = aws_route_table.pri_route_prisub1a.id

}



resource "aws_route_table" "pri_route_prisub2a" {
  vpc_id = aws_vpc.twotiervpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.aws_nat_gateway2.id
  }

  tags = {
    Name = "privateAZ2"
  }
}

resource "aws_route_table_association" "pri_route_prisub3a" {
  subnet_id = aws_subnet.prisub_3a.id
  route_table_id = aws_route_table.pri_route_prisub2a.id

}


resource "aws_route_table_association" "pri_route_prisub4a" {
  subnet_id = aws_subnet.prisub_4a.id
  route_table_id = aws_route_table.pri_route_prisub2a.id

}