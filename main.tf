# Fetch the latest Ubuntu 24.04 AMI

data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

# Create EC2 Instance

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type = "t2.micro"

  tags = {
    Name    = "Terraform-Day01"
    Owner   = "Akash"
    Project = "TerraWeek"
  }
}