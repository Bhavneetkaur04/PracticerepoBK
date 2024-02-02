resource "aws_vpc" "demotest" {
  cidr_block = var.cidr
}

resource "aws_subnet" "demotestsub" {
  vpc_id = aws_vpc.demotest.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = "true"
 
}

resource "aws_internet_gateway" "demotestigw" {
  vpc_id = aws_vpc.demotest.id
}

resource "aws_route_table" "demotestrt" {
  vpc_id = aws_vpc.demotest.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demotestigw.id
  }
}

resource "aws_route_table_association" "RTA1" {
  subnet_id = aws_subnet.demotestsub.id
  route_table_id = aws_route_table.demotestrt.id

}

resource "aws_security_group" "demotestsg" {
  name = "Test"
  vpc_id = aws_vpc.demotest.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

