resource "aws_iam_role" "tfs_lambda_basic_execution" {
  name = "tfs_lambda_basic_execution"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"lambda.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
