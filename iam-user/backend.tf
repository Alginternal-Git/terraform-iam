terraform {
  backend "s3" {
    bucket         = "iamuser1234"
    key            = "iam-user/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
  }
}
