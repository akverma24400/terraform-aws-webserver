# 📅 Day 02 - Terraform Configuration Language (HCL)

Today's focus was on making the Terraform code reusable, dynamic, and production-ready.

## ✅ What I Implemented

- Terraform Variables
- terraform.tfvars
- Input Validation
- Local Values (locals)
- Terraform Outputs
- Dynamic Resource Naming
- Clean Project Structure

---

# 📂 Project Structure

```text
terraform-aws-webserver/
│
├── provider.tf
├── versions.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── locals.tf
├── outputs.tf
├── README.md
└── .gitignore
```

---

# ⚙️ Technologies Used

- Terraform
- AWS EC2
- AWS CLI
- HCL (HashiCorp Configuration Language)
- Git
- GitHub

---

# 📜 Terraform Workflow

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

---

# 📁 Variables Used

| Variable | Description |
|----------|-------------|
| aws_region | AWS Deployment Region |
| ami_id | Ubuntu AMI ID |
| instance_type | EC2 Instance Type |
| project_name | Project Name |
| owner | Resource Owner |

---

# 📤 Outputs

The following outputs are generated automatically after deployment:

- Instance ID
- Public IP
- Public DNS
- Availability Zone

---

# 🎯 Key Learnings

- Understanding HashiCorp Configuration Language (HCL)
- Eliminating hardcoded values using variables
- Using terraform.tfvars for configuration management
- Implementing input validation
- Creating reusable local values
- Exporting useful infrastructure information using outputs

---


- Terraform Validate
- Terraform Plan
- Terraform Apply
- Terraform Outputs
- AWS EC2 Console
- GitHub Repository

---

# 🚀 Next Goal (Day 03)

Tomorrow I will provision:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 Instance inside the custom VPC

using Terraform.

---

# 👨‍💻 Author

**Akash Verma**

- GitHub: https://github.com/akverma24400
- LinkedIn: *https://www.linkedin.com/in/akash-verma-2ab99324b/*

---

## ⭐ If you like this project, consider giving it a star!

This repository is part of the **TrainWithShubham #TerraWeek Challenge**.