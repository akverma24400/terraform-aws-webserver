# 📚 Day 05 - Terraform Modules Notes

## 🎯 Objective

Today, I learned how to organize Terraform code using **Modules** to make Infrastructure as Code reusable, scalable, and easier to maintain.

Instead of keeping all resources in a single `main.tf` file, I separated the infrastructure into reusable modules.

---

# 🧩 What is a Terraform Module?

A **Terraform Module** is a collection of Terraform configuration files that are grouped together to perform a specific task.

A module allows us to write infrastructure code once and reuse it across multiple projects.

```
Terraform Project
│
├── Root Module
│
├── Network Module
│
├── Security Module
│
└── EC2 Module
```

---

# ❓ Why Use Terraform Modules?

Without Modules:

```
Project A
├── VPC
├── EC2
├── Security Group

Project B
├── VPC
├── EC2
├── Security Group

❌ Duplicate Code
```

With Modules:

```
Reusable Module

↓

Project A

Project B

Project C

✅ Reusable Infrastructure
```

---

# 📂 Project Structure

```
terraform-aws-webserver/
│
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── security/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── locals.tf
├── main.tf
├── outputs.tf
├── user_data.sh
├── Dockerfile
├── website/
│   └── index.html
└── README.md
```

---

# 🌐 Network Module

The **Network Module** is responsible for creating networking resources.

Resources included:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association

### Outputs

- VPC ID
- Subnet ID
- Internet Gateway ID
- Route Table ID

---

# 🔐 Security Module

The **Security Module** creates the Security Group.

Ingress Rules:

- SSH (22)
- HTTP (80)
- HTTPS (443)

Egress Rules:

- Allow All Traffic

### Outputs

- Security Group ID

---

# 🖥️ EC2 Module

The **EC2 Module** creates the EC2 Instance.

Responsibilities:

- Launch EC2
- Attach Security Group
- Attach Public Subnet
- Execute User Data Script
- Configure Tags

### Outputs

- Instance ID
- Public IP
- Public DNS

---

# 🔄 Module Inputs

Modules receive values using **Variables**.

Example:

```hcl
module "network" {

  source = "./modules/network"

  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.public_subnet_cidr
  availability_zone = var.availability_zone

  project_name = var.project_name
  owner         = var.owner

}
```

---

# 📤 Module Outputs

Modules expose resource information using **Outputs**.

Example:

```hcl
output "vpc_id" {
  value = aws_vpc.main.id
}
```

The Root Module accesses it like this:

```hcl
module.network.vpc_id
```

---

# 🔗 Module Communication

Modules communicate using **Outputs** and **Variables**.

Example:

```
Network Module

↓

Outputs

↓

Security Module

↓

Outputs

↓

EC2 Module
```

Example:

```
module.network.vpc_id

↓

module.security.vpc_id

↓

module.security.security_group_id

↓

module.ec2.security_group_id
```

---

# 📄 Root Module

After modularization, the root `main.tf` only calls modules.

```
Root Module

↓

Network Module

↓

Security Module

↓

EC2 Module
```

This makes the project much cleaner and easier to understand.

---

# 🐳 Docker Integration

Instead of running the default Nginx container, I created a custom Docker image.

Project Structure:

```
website/

↓

Dockerfile

↓

Docker Image

↓

Docker Hub

↓

EC2 Instance

↓

Docker Container

↓

Custom Website
```

Dockerfile:

```dockerfile
FROM nginx:latest

COPY website/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

---

# 📜 User Data Script

The EC2 instance automatically:

- Updates packages
- Installs Docker
- Starts Docker service
- Pulls Docker image from Docker Hub
- Runs the container on Port 80

---

# ⚙️ Terraform Commands Used

## Initialize Terraform

```bash
terraform init
```

---

## Format Terraform Code

```bash
terraform fmt -recursive
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Preview Infrastructure

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# 💡 Best Practices

- Keep modules focused on a single responsibility.
- Use variables for configurable values.
- Use outputs to share resource information.
- Avoid hardcoding resource IDs.
- Keep the root module clean.
- Use meaningful tags for AWS resources.
- Store reusable code inside the `modules/` directory.
- Keep Dockerfile and website source code under version control.

---

# 🎤 Interview Questions

## Q1. What is a Terraform Module?

A Terraform Module is a reusable collection of Terraform configuration files used to organize and simplify infrastructure code.

---

## Q2. Why do we use Modules?

Modules improve:

- Code Reusability
- Maintainability
- Scalability
- Readability

---

## Q3. What is the Root Module?

The Root Module is the main Terraform configuration that calls one or more child modules.

---

## Q4. What are Child Modules?

Child Modules are reusable modules that perform a specific task and are called from the Root Module.

---

## Q5. How do Modules communicate?

Modules communicate using:

- Input Variables
- Output Values

---

## Q6. Why should infrastructure be modular?

Modular infrastructure reduces code duplication, simplifies maintenance, improves collaboration, and allows infrastructure components to be reused across different projects.

---

# 📌 Key Takeaways

- Terraform Modules help organize infrastructure into reusable components.
- Root Modules call Child Modules.
- Variables pass data into modules.
- Outputs expose resource information from modules.
- Modules improve scalability and maintainability.
- Docker can be integrated with Terraform to automate application deployment.
- A modular Terraform project is easier to manage, test, and extend.

---

# 🚀 Day 05 Summary

Today, I transformed my Terraform project into a **modular Infrastructure as Code solution** by creating reusable **Network**, **Security**, and **EC2** modules. I also integrated **Docker** to deploy a custom Nginx website on an AWS EC2 instance, making the project more production-ready. This approach improved code organization, reusability, and maintainability while following DevOps best practices.