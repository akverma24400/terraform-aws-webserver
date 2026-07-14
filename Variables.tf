variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

/* variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
} */


variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Only t2.micro or t3.micro are allowed."
  }
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "TerraWeek"
}

variable "owner" {
  description = "Owner Name"
  type        = string
  default     = "Akash"
}

# Networking Variables

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
}