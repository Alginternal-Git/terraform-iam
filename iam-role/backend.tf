terraform {
  backend "s3" {
    bucket         = "iamuser1234"
    key            = "iam-role/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
