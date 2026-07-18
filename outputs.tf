output "website_url" {
  description = "Website URL"
  value       = "http://${module.ec2.public_ip}"
}

output "public_ip" {
  description = "EC2 Public IP"
  value       = module.ec2.public_ip
}

output "public_dns" {
  description = "EC2 Public DNS"
  value       = module.ec2.public_dns
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = module.ec2.instance_id
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.network.subnet_id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.security.security_group_id
}