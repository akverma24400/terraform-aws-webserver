variable "vpc_id" {
  description = "VPC ID where Security Group will be created"
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