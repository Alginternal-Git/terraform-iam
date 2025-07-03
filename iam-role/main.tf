provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_role" "readonly_role" {
  name = var.readonly_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "*"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "readonly_attach" {
  role       = aws_iam_role.readonly_role.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}