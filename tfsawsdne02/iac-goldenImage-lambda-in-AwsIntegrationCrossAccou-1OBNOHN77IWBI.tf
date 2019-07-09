resource "aws_iam_role" "iac-goldenImage-lambda-in-AwsIntegrationCrossAccou-1OBNOHN77IWBI" {
  name = "iac-goldenImage-lambda-in-AwsIntegrationCrossAccou-1OBNOHN77IWBI"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
