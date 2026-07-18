variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
}

variable "owner" {
  type = string
}
variable "private_key_path" {
  description = "Path to the private SSH key"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}