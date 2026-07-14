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

#updated the aws_instance resource to use the ami_id variable from terraform.tfvars

resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id
  key_name  = var.key_name

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data.sh") #added user_data.sh file to install docker, Nginx and create a simple HTML page

  tags = merge(
    local.common_tags,
    {
      Name = local.instance_name
    }
  )
}

#Creating a security group for the EC2 instance


resource "aws_security_group" "web" {

  name        = "terraform-web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {

    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    description = "HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    description = "HTTPS"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(
    local.common_tags,
    {
      Name = "Terraform-Web-SG"
    }
  )
}