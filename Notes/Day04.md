# 📚 Day 04 - Terraform State Management Notes

## 🎯 What is Terraform State?

Terraform State is a file (`terraform.tfstate`) that stores information about the infrastructure managed by Terraform.

It acts as a bridge between your Terraform configuration and the real infrastructure running in AWS.

```
Terraform Configuration
        │
        ▼
 terraform.tfstate
        │
        ▼
   AWS Infrastructure
```

---

# 📄 What is `terraform.tfstate`?

The `terraform.tfstate` file contains:

- Resource IDs
- Resource Attributes
- Metadata
- Dependencies
- Current Infrastructure State

Terraform uses this file to determine what changes are required during each execution.

---

# ❓ Why is Terraform State Important?

Without the state file, Terraform would not know:

- Which resources already exist
- Which resources need to be updated
- Which resources should be deleted

Terraform compares:

**Desired State (Terraform Code)**

with

**Current State (terraform.tfstate)**

to generate an execution plan.

---

# 🏠 Local State

By default, Terraform stores its state locally.

```
terraform.tfstate
```

### Advantages

- Easy to configure
- Ideal for learning
- No additional AWS resources required

### Disadvantages

- Not suitable for team collaboration
- Easy to lose or accidentally delete
- No state locking
- Not recommended for production

---

# ☁️ Remote State

Instead of storing the state locally, Terraform can store it remotely.

For AWS, the recommended backend is:

- Amazon S3 → Stores the Terraform State
- Amazon DynamoDB → Provides State Locking

```
Developer

    │

Terraform

    │

S3 Bucket

    │

terraform.tfstate

    │

DynamoDB Lock Table
```

---

# 🪣 Why Use Amazon S3?

Amazon S3 provides secure and centralized storage for Terraform State.

### Benefits

- Centralized storage
- Team collaboration
- Versioning support
- High durability
- Secure access using IAM
- Backup and recovery

---

# 🔒 Why Use DynamoDB?

DynamoDB is used for **State Locking**.

It prevents multiple users from modifying infrastructure simultaneously.

### Without Locking

```
Developer A → terraform apply

Developer B → terraform apply

❌ State Corruption
```

### With DynamoDB Locking

```
Developer A

↓

Lock Acquired

↓

terraform apply

↓

Lock Released

↓

Developer B can continue

✅ Safe Deployment
```

---

# 📂 Backend Configuration

Example:

```hcl
terraform {
  backend "s3" {

    bucket         = "your-bucket-name"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true

  }
}
```

### Backend Parameters

| Parameter | Description |
|------------|-------------|
| bucket | S3 Bucket Name |
| key | Path of State File |
| region | AWS Region |
| dynamodb_table | DynamoDB Table for Locking |
| encrypt | Encrypt State File |

---

# 🔄 State Migration

When switching from Local Backend to S3 Backend:

```bash
terraform init
```

Terraform asks:

```
Do you want to migrate your existing state?
```

Type:

```
yes
```

Terraform automatically uploads the local state file to Amazon S3.

---

# 📂 Files Added

```
backend.tf

backend-resources.tf
```

---

# ⚙️ Terraform Commands Used

## Initialize Terraform

```bash
terraform init
```

---

## Format Code

```bash
terraform fmt
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

## Apply Infrastructure

```bash
terraform apply
```

---

## List State Resources

```bash
terraform state list
```

---

## Show Resource Details

```bash
terraform state show <resource_name>
```

---

# 💡 Best Practices

- Store Terraform State remotely using Amazon S3.
- Enable Versioning on the S3 Bucket.
- Block Public Access for the S3 Bucket.
- Enable State Locking using DynamoDB.
- Never commit `terraform.tfstate` to GitHub.
- Add `.terraform/` and `terraform.tfstate*` to `.gitignore`.
- Use separate backends for Development, Testing, and Production environments.

---

# 🎤 Interview Questions

## Q1. What is Terraform State?

Terraform State is a file that stores the current state of infrastructure managed by Terraform. It helps Terraform determine what changes are required to match the desired infrastructure.

---

## Q2. Why do we use Remote State?

Remote State enables secure storage, collaboration among multiple users, backup, and centralized infrastructure management.

---

## Q3. Why do we use Amazon S3?

Amazon S3 provides secure, durable, and versioned storage for the Terraform State file.

---

## Q4. Why do we use DynamoDB?

DynamoDB provides state locking, ensuring that only one user or process can modify the infrastructure at a time.

---

## Q5. What happens if the Terraform State file is deleted?

Terraform loses track of the infrastructure it manages. Existing AWS resources remain, but Terraform cannot manage them until the state is restored or the resources are imported again.

---

# 📌 Key Takeaways

- Terraform State is the source of truth for managed infrastructure.
- Local State is useful for learning but not for production.
- Remote State is the recommended approach for teams.
- Amazon S3 securely stores the Terraform State.
- DynamoDB prevents concurrent modifications through state locking.
- `terraform init` is used to initialize Terraform and migrate the backend.
- Protecting the state file is essential because it contains metadata about your infrastructure.

---

# 🚀 Day 04 Summary

Today I learned how Terraform tracks infrastructure using the **State File**, why **Remote State** is important for collaboration, and how to configure **Amazon S3** and **DynamoDB** to build a secure, production-ready backend with state locking. This is one of the most important concepts in real-world Terraform workflows and DevOps practices.