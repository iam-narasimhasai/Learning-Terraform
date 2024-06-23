
resource "aws_subnet" "pubsub_1a" {
  vpc_id = aws_vpc.twotiervpc.id
  cidr_block = var.pubsub_1a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub_1a"
  }
}


resource "aws_subnet" "pubsub_2a" {
  vpc_id = aws_vpc.twotiervpc.id
  cidr_block = var.pubsub_2a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsub_2a"
  }
}


resource "aws_subnet" "prisub_1a" {
  vpc_id = aws_vpc.twotiervpc.id
  cidr_block = var.prisub_1a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "prisub_1a"
  }
}



resource "aws_subnet" "prisub_2a" {
  vpc_id = aws_vpc.twotiervpc.id
  cidr_block = var.prisub_2a_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "prisub_2a"
  }
}

resource "aws_subnet" "prisub_3a" {
  vpc_id = aws_vpc.twotiervpc.id
  cidr_block = var.prisub_3a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "prisub_3a"
  }
}

resource "aws_subnet" "prisub_4a" {
  vpc_id = aws_vpc.twotiervpc.id
  cidr_block = var.prisub_4a_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "prisub_4a"
  }
}





