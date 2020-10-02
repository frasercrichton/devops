
resource "aws_vpc" "forensic_architecuture_vpc" {

  cidr_block = var.VPC-CIDR-block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Primary VPC: ${var.organisation}"
  }

}

resource "aws_internet_gateway" "internet_gate_way" {
  vpc_id = aws_vpc.forensic_architecuture_vpc.id
  tags = {
    Name = "Primary Internet Gateway: ${var.organisation}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.forensic_architecuture_vpc.id
  cidr_block = var.public_subnet_CIDR_block
  # map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  tags = {
    Name = "Primary Subnet: ${var.organisation}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.forensic_architecuture_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gate_way.id
  }
  tags = {
    Name = "Primary Public Route Table: ${var.organisation}"
  }
}

resource "aws_security_group" "forensic_architecure_vpc_security_group" {
  name        = "forensic-architecure-vpc-security-group"
  description = "Security Group for VPC"
  vpc_id      = aws_vpc.forensic_architecuture_vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
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
    Name = "Primary Subnet: ${var.organisation}"
  }
}


# subnet_id     = "${module.vpc.subnets[0]}"

resource "aws_instance" "testInstance" {
  ami                    = "ami-2757f631"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.forensic_architecure_vpc_security_group.id]
  //key_name = "${aws_key_pair.ec2key.key_name}"
  tags = {
    Name = "Instance: ${var.organisation}"
  }
}