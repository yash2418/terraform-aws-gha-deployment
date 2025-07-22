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
