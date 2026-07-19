# 🚀 Terraform AWS WebServer | TerraWeek Challenge

<div align="center">

![Terraform](https://img.shields.io/badge/Terraform-1.13+-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazonaws)
![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=for-the-badge&logo=docker)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=for-the-badge&logo=ubuntu)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

### 🌍 Building Production-Ready AWS Infrastructure using Terraform

</div>

---

# 📖 About

This repository contains my hands-on implementation of the **TrainWithShubham #TerraWeek Challenge**.

Over **7 days**, I'm building a production-style AWS infrastructure using **Terraform**, following Infrastructure as Code (IaC) best practices.

The project starts with deploying a single EC2 instance and gradually evolves into a modular, production-ready infrastructure.

---

# 🛠️ Tech Stack

- Terraform
- AWS (EC2, VPC, S3, DynamoDB)
- AWS CLI
- Git & GitHub
- GitHub Actions
- HCL (HashiCorp Configuration Language)

---

# 📂 Project Structure

```
terraform-aws-webserver/
│
├── modules/
│   ├── ec2/
│   ├── network/
│   └── security/
│
├── website/
│   ├── index.html
│   ├── style.css
│   └── images/
│
├── Notes/
│   ├── Day01.md
│   ├── Day02.md
│   ├── Day03.md
│   ├── Day04.md
│   ├── Day05.md
│   ├── Day06.md
│   └── Day07.md
│
├── Screenshots/
│   ├── Day01/
│   ├── Day02/
│   ├── Day03/
│   ├── Day04/
│   ├── Day05/
│   ├── Day06/
│   └── Day07/
│
├── data.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── variables.tf
├── Dockerfile
├── user_data.sh
├── README.md
└── LICENSE
```

---

# 🗺️ TerraWeek Roadmap

## ✅ Day 01 - Terraform Fundamentals

- Install Terraform & AWS CLI
- Configure AWS Provider
- Deploy First EC2 Instance
- Learn Terraform Workflow
- Push Project to GitHub

**Status:** ✅ Completed

---

## ✅ Day 02 - Terraform HCL

- Variables
- terraform.tfvars
- Outputs
- Local Values
- Input Validation
- Reusable Configuration

**Status:** ✅ Completed

---

## ✅ Day 03 - AWS Networking

- Create VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- Deploy EC2 in Custom VPC
- Install Docker & Nginx

**Status:** ✅ Completed

---

## ✅ Day 04 - Remote State

- S3 Backend
- DynamoDB State Locking
- Remote Terraform State

**Status:** ✅ Completed
---

## ✅ Day 05 - Terraform Modules

- Create Network Module
- Create EC2 Module
- Create Security Module
- Modular Infrastructure

**Status:** ✅ Completed
---

## ✅ Day 06 - Best Practices

- Provider Versioning
- GitHub Actions CI
- terraform fmt
- terraform validate
- terraform plan

**Status:** ✅ Completed

---

## ✅ Day 07 - Final Project

- Production-ready Infrastructure
- Architecture Diagram
- Documentation
- Screenshots
- Final GitHub Cleanup
- LinkedIn & Challenge Submission

**Status:** ✅ Completed

---

# ⚙️ Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

---

# 📊 Challenge Progress

| Day | Status |
|------|--------|
| Day 01 | ✅ Completed |
| Day 02 | ✅ Completed |
| Day 03 | ✅ Completed |
| Day 04 | ✅ Completed |
| Day 05 | ✅ Completed |
| Day 06 | ✅ Completed |
| Day 07 | ✅ Completed |

---

# 🎯 Final Outcome

By the end of this challenge, this repository will include:

- ✅ Production-ready Terraform code
- ✅ AWS Infrastructure
- ✅ Remote State Management
- ✅ Terraform Modules
- ✅ GitHub Actions CI Pipeline
- ✅ Clean Documentation
- ✅ Reusable Infrastructure Design

---

# 👨‍💻 Author

**Akash Verma**

- 💼 LinkedIn: *https://www.linkedin.com/in/akash-verma-2ab99324b/*
- 🐙 GitHub: https://github.com/akverma24400

---

⭐ **If you like this project, don't forget to star the repository!**

**#Terraform #AWS #InfrastructureAsCode #DevOps #Cloud #TrainWithShubham #TerraWeekChallenge**