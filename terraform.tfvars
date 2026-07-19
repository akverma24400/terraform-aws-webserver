aws_region    = "us-east-1"
instance_type = "t2.micro"
project_name  = "TerraWeek"
owner         = "Akash Verma"

vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone  = "us-east-1a"
key_name           = "terraform-key"                                  # Replace with your actual key pair name
private_key_path   = "C:\\Users\\akver\\Downloads\\terraform-key.pem" # Replace with the path to your private key file