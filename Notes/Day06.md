# 📚 Day 06 - Terraform Best Practices & Project Enhancement

## 🎯 Objective

On Day 06, I focused on improving my Terraform project by implementing **best practices** instead of just adding more resources. The goal was to make the infrastructure more **maintainable, reusable, and production-ready**.

---

# 🚀 Topics Covered

- Terraform Locals
- Common Tags
- Terraform Data Sources
- Terraform Outputs
- Code Reusability
- Project Organization
- Best Practices

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
├── data.tf
├── locals.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── main.tf
├── Dockerfile
├── user_data.sh
├── website/
│   └── index.html
└── README.md
```

---

# 📌 Terraform Locals

Terraform **locals** allow us to define reusable values that can be referenced throughout the project.

Example:

```hcl
locals {

  common_tags = {
    Owner       = var.owner
    Project     = var.project_name
    Environment = "Development"
    ManagedBy   = "Terraform"
  }

}
```

### Benefits

- Reduces duplicate code
- Improves readability
- Makes configuration easier to maintain
- Keeps tagging consistent

---

# 🏷️ Common Tags

Instead of writing the same tags for every AWS resource, common tags are defined once and merged with resource-specific tags.

Example:

```hcl
tags = merge(
  var.common_tags,
  {
    Name = "${var.project_name}-VPC"
  }
)
```

### Advantages

- Consistent resource tagging
- Easier cost allocation
- Better resource management
- Simplifies governance

---

# 📌 Terraform Data Sources

A **Data Source** retrieves information from existing AWS resources without creating them.

Instead of hardcoding the Ubuntu AMI ID:

```hcl
ami = "ami-xxxxxxxx"
```

I used a Data Source:

```hcl
data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

}
```

Then referenced it:

```hcl
ami_id = data.aws_ami.ubuntu.id
```

### Benefits

- Always uses the latest Ubuntu AMI
- No hardcoded IDs
- More portable Terraform code
- Easier maintenance

---

# 📤 Terraform Outputs

Outputs expose useful information after infrastructure deployment.

Example:

```hcl
output "website_url" {
  value = "http://${module.ec2.public_ip}"
}
```

Other outputs:

- Instance ID
- Public IP
- Public DNS
- VPC ID
- Subnet ID
- Security Group ID

Retrieve outputs anytime:

```bash
terraform output
```

---

# 📦 Merge Function

Terraform's `merge()` function combines multiple maps into a single map.

Example:

```hcl
tags = merge(
  var.common_tags,
  {
    Name = "TerraWeek-VPC"
  }
)
```

Result:

```
Owner
Project
Environment
ManagedBy
Name
```

---

# 📌 Terraform Commands Used

## Format Code

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

## View Outputs

```bash
terraform output
```

---

# 📚 Best Practices Learned

✅ Use **Locals** to avoid duplicate values.

✅ Keep tags consistent across all resources.

✅ Use **Data Sources** instead of hardcoding AWS resource IDs.

✅ Keep modules reusable.

✅ Use **Outputs** to expose important infrastructure details.

✅ Follow a clean project structure.

---

# 🎤 Interview Questions

## Q1. What are Terraform Locals?

Terraform Locals are reusable values defined within a Terraform configuration that help reduce duplication and improve readability.

---

## Q2. Why use Common Tags?

Common Tags ensure consistency, simplify cost tracking, improve resource management, and reduce repetitive code.

---

## Q3. What is a Terraform Data Source?

A Data Source reads information from existing infrastructure or cloud services without creating new resources.

---

## Q4. Resource vs Data Source

| Resource | Data Source |
|----------|-------------|
| Creates Infrastructure | Reads Existing Infrastructure |
| Changes Cloud State | Read-Only |
| Uses `resource` | Uses `data` |

---

## Q5. What is the merge() function?

The `merge()` function combines multiple maps into one, making it useful for applying shared tags while allowing resource-specific values.

---

## Q6. Why are Outputs important?

Outputs provide useful infrastructure details after deployment, such as IP addresses, IDs, URLs, and DNS names.

---

# 💡 Key Takeaways

- Learned how to use **Terraform Locals** for reusable configuration.
- Implemented **Common Tags** using the `merge()` function.
- Used **Terraform Data Sources** to dynamically fetch the latest Ubuntu AMI.
- Created **Terraform Outputs** for important infrastructure details.
- Improved project organization by following Infrastructure as Code best practices.
- Built a cleaner, more scalable, and production-ready Terraform project.

---

# 🚀 Day 06 Summary

Today, I enhanced my Terraform project by applying **production-ready best practices** rather than simply adding more resources. I implemented **Terraform Locals**, **Common Tags**, **Data Sources**, and **Outputs** to improve code reusability, maintainability, and readability. These improvements make the infrastructure easier to manage and better aligned with real-world DevOps workflows.