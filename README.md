# Terraform IAM Infrastructure Setup

This repository automates the provisioning of IAM resources using Terraform and GitHub Actions, with remote state management via S3.

---

## Folder Structure

terraform-iam/
├── backend-setup/                 # One-time setup for S3 bucket
│   └── main.tf
│
├── iam-user/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   └── backend.tf                # <-- Defines S3 backend for this module
│
├── iam-role/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   └── backend.tf                # <-- Defines S3 backend for this module
│
├── .github/
│   └── workflows/
│       ├── deploy-iam-user.yml
│       ├── deploy-iam-role.yml
│       └── deploy-backend.yml   #  to create the state bucket via CI
│
└── README.md


---

## How It Works

### 1. **Remote Backend**

Terraform state files are stored in a remote S3 bucket:

- 'iamuser1234'
- State is isolated for each module:
  - `iam-user/terraform.tfstate`
  - `iam-role/terraform.tfstate`

### 2. **GitHub Actions Workflows**

Workflows are manually triggered via the **Actions** tab:

| Workflow            | Description                          | Directory       |
|---------------------|--------------------------------------|-----------------|
| `backend.yml`        | Creates the S3 backend bucket         | `backend-setup/`|
| `deploy-iam-user.yml`| Provisions IAM user with Admin access| `iam-user/`     |
| `deploy-iam-role.yml`| Provisions IAM role with ReadOnly    | `iam-role/`     |

---

## How to Use

###  1. Setup Backend (Run Once)

Go to GitHub → Actions → **Run `Setup Terraform Backend`**

How to Destroy 
Sample Snippet to Insert in Your Workflow
-----------------------------------------

      - name: Terraform Init
        working-directory: ${{ env.TF_WORKING_DIR }}
        run: terraform init

      - name: Terraform Destroy
        working-directory: ${{ env.TF_WORKING_DIR }}
        run: terraform destroy -var-file="terraform.tfvars" -auto-approve


Once committed to .github/workflows/, you can trigger the destroy workflow directly from the Actions tab in GitHub.