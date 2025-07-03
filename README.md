
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

>>>>>>> c937b2105f6a28ec068ca7964771f36939e630da