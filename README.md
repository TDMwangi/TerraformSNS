# Terraform SNS

The project uses Terraform to deploy an SNS service to AWS.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v0.12+)
- [AWS CLI](https://aws.amazon.com/cli/) configured with your AWS credentials
- An AWS account

## Getting Started

### 1. Initialize Terraform

Terraform requires initialization before using the project. Run the following command:

```sh
terraform init
```

### 2. Plan Infrastructure

Run the following command to see what resources will be created or changed:

```sh
terraform plan
```

### 3. Apply Infrastructure

To deploy the SNS service to AWS, run:

```sh
terraform apply
```

Confirm the apply step by typing `yes` when prompted.

### 4. Destroy Infrastructure

To clean up and remove all resources created by Terraform, run:

```sh
terraform destroy
```

Confirm the destroy step by typing `yes` when prompted.
