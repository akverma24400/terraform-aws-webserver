variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "owner" {
  description = "Owner Name"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}