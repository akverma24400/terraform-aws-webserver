locals {

  instance_name = "${var.project_name}-Day03"

  common_tags = {
    Owner   = var.owner
    Project = var.project_name
  }

}