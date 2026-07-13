resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name    = local.instance_name
    Owner   = var.owner
    Project = var.project_name
  }
}