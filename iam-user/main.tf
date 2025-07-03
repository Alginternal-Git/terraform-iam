provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_user" "admin_user" {
  name = var.iam_user_name
}

resource "aws_iam_user_policy_attachment" "admin_attach" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}