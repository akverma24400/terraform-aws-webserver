resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id


  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = file("${path.root}/user_data.sh")

  tags = {
    Name    = "${var.project_name}-WebServer"
    Owner   = var.owner
    Project = var.project_name
  }


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}