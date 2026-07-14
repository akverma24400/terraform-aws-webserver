resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true

  enable_dns_support = true

  tags = merge(
    local.common_tags,
    {
      Name = "TerraWeek-VPC"
    }
  )
}

resource "aws_subnet" "public" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_cidr

  availability_zone = var.availability_zone

  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "Public-Subnet"
    }
  )
}


resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    {
      Name = "TerraWeek-IGW"
    }
  )
}


resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

  }

  tags = merge(
    local.common_tags,
    {
      Name = "Public-RouteTable"
    }
  )
}

resource "aws_route_table_association" "public" {

  subnet_id = aws_subnet.public.id

  route_table_id = aws_route_table.public.id

}


resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name    = local.instance_name
    Owner   = var.owner
    Project = var.project_name
  }
}