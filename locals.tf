# Reusable Common Tags with Terraform Locals
locals {

  common_tags = {
    Owner       = var.owner
    Project     = var.project_name
    Environment = "Development"
    ManagedBy   = "Terraform"
  }

}