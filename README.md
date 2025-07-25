# terraform-aws-gha-deployment

This repository provides Terraform modules and configuration for deploying infrastructure on AWS using GitHub Actions. It is designed to automate the provisioning and management of AWS resources for CI/CD workflows.

## Features

- **Infrastructure as Code**: Define AWS resources using Terraform.
- **GitHub Actions Integration**: Automate deployments from GitHub repositories.
- **Reusable Modules**: Modular design for easy customization and reuse.
- **Secure Deployments**: Follows best practices for IAM and secrets management.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0+
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- AWS account credentials
- GitHub repository

## Usage

1. **Clone the repository**:
    ```sh
    git clone https://github.com/<your-org>/terraform-aws-gha-deployment.git
    cd terraform-aws-gha-deployment
    ```

2. **Configure AWS credentials**:
    ```sh
    export AWS_ACCESS_KEY_ID=your-access-key
    export AWS_SECRET_ACCESS_KEY=your-secret-key
    ```

3. **Initialize Terraform**:
    ```sh
    terraform init
    ```

4. **Review and apply the configuration**:
    ```sh
    terraform plan
    terraform apply
    ```

## GitHub Actions Workflow

Integrate with GitHub Actions by using the provided workflow templates in `.github/workflows/`.

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements.


https://raw.githubusercontent.com/bridgecrewio/checkov/refs/heads/main/docs/5.Policy%20Index/all.md


🚀 CI/CD for Terraform Using GitHub Actions: Validate Before You Deploy
Infrastructure as Code (IaC) allows teams to manage cloud infrastructure in a repeatable and automated way. Terraform is one of the most widely used IaC tools — but writing code is just the first step.

Without proper validation and scanning, we risk deploying misconfigured or insecure infrastructure.

In this article, I’ll walk through a GitHub Actions-based CI/CD setup for Terraform, built around two goals:

✅ Validate and scan Terraform changes on every pull request

🚀 Deploy automatically when code is merged to main

🧩 Why This Pipeline?
Manual Terraform deployments can lead to:

❌ Missed validation or formatting issues

⚠️ Security risks like unencrypted resources

🚫 Merges without review or checks

🐛 Inconsistencies between environments

This GitHub Actions pipeline solves that by:

Automating validation and security scans

Blocking merges on failed checks

Deploying only validated, reviewed code

🔧 Tools Used
Tool	Purpose
Terraform	Define cloud infrastructure
GitHub Actions	CI/CD pipeline execution
Checkov	Security and best-practice scanning
GitHub Branch Protection	Enforce merge safety rules

📁 Pipeline Structure Overview
We use two GitHub Actions workflows:

1️⃣ PR Validation Pipeline
This workflow runs when a pull request is opened from a feature/* branch into main.

🔍 What it does:
Run terraform init, fmt, and validate

Run Checkov to scan for security issues

Run terraform plan to preview infrastructure changes

If any step fails, the GitHub Action fails and the PR cannot be merged — thanks to branch protection rules.

📝 Workflow File: .github/workflows/terraform-pr-check.yml

🔧 Insert Code Snippet Placeholder:

yaml
Copy
Edit
# Terraform PR validation pipeline (placeholder)
📸 Screenshot Placeholders:

✅ Successful PR validation run

❌ Failed validation due to Checkov scan

📦 What Are We Deploying?
In this demo, we’re deploying a simple AWS SNS topic using Terraform.

🔐 Unencrypted SNS Topic Example
Here’s the initial Terraform code:

hcl
Copy
Edit
resource "aws_sns_topic" "demo_topic" {
  name = "demo-sns-topic"
}
This creates an SNS topic without encryption, which is a potential security risk.

❌ Checkov Flags a Security Violation
When the PR is raised, our pipeline runs Checkov, which detects the following:

CKV_AWS_26 – Ensure all data stored in the SNS topic is encrypted

📸 Screenshot Placeholder:
❌ Checkov scan failure showing CKV_AWS_26

Because this violation is critical, the pipeline fails and the PR is blocked from being merged.

✅ Fixing the Violation
We update the resource to enable encryption with a managed AWS KMS key:

hcl
Copy
Edit
resource "aws_sns_topic" "demo_topic" {
  name              = "demo-sns-topic"
  kms_master_key_id = "alias/aws/sns"
}
📸 Screenshot Placeholder:
✅ Successful pipeline run after enabling encryption

This proves our validation pipeline works — we blocked insecure code and enforced best practices before deployment.

🛡️ Enforcing Safe Merges with Branch Protection
To ensure only secure, validated code gets merged into main, we’ve enabled GitHub branch protection rules.

✅ This requires:

All checks (like the PR pipeline) must pass

Pull requests must be reviewed

Direct pushes to main are blocked

📸 Screenshot Placeholder:
🔒 Branch protection rules on main

“Branch protection ensures every infrastructure change is reviewed and validated before it hits production.”

2️⃣ Post-Merge Deployment Pipeline
Once the pull request is merged, a second GitHub Actions workflow triggers automatically.

What it does:
terraform init

terraform apply -auto-approve

Only code that passed validation and review gets deployed.

📝 Workflow File: .github/workflows/terraform-deploy.yml

🔧 Insert Code Snippet Placeholder:

yaml
Copy
Edit
# Terraform deploy pipeline (placeholder)
📸 Screenshot Placeholder:
✅ Successful deployment after merge

🔁 Why Security Scans Matter
Security misconfigurations are easy to miss — especially for resources like S3 buckets, SNS topics, or IAM policies.

Checkov helps catch:

Unencrypted data storage

Public access on sensitive resources

Missing logging or tagging

Non-compliant infrastructure

By running Checkov in our PR validation pipeline, we fail fast, ensuring no insecure resource is deployed.

📦 Versioning and Commit Conventions
To maintain clean release histories and changelogs, this repo uses:

Conventional Commits (feat, fix, etc.)

Semantic Versioning for tagging releases

Release Please GitHub Action for automated release PRs

Example Commit Messages:
bash
Copy
Edit
feat: add SNS topic
fix: enable encryption for SNS
✅ These commit types trigger version bumps automatically:

feat → minor bump (1.1.0)

fix → patch bump (1.1.1)

📸 Screenshot Placeholder:

Auto-generated release PR or changelog with version tags (e.g., v1.2.0)

“This helps ensure every infrastructure change is versioned, traceable, and documented — without manual effort.”

✅ Final Thoughts
With just two GitHub workflows, we’ve created a reliable Terraform CI/CD pipeline that:

Automates formatting, validation, and scanning

Blocks insecure infrastructure changes

Deploys only approved, peer-reviewed code

Automatically versions and tags releases based on commit messages

This setup is simple, scalable, and production-ready.

📌 What’s Next?
Add Slack/Teams notifications

Support for dev, stage, and prod environments

Auto terraform destroy for PR preview environments

🔗 GitHub Repo: [Insert your GitHub repository link here]
💬 Have questions or feedback? Drop them in the comments!