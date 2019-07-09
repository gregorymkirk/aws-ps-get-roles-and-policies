resource "aws_iam_role" "dne01-cross-account-ec2-a-AwsIntegrationCrossAccou-ELIS1JQV76R8" {
  name = "dne01-cross-account-ec2-a-AwsIntegrationCrossAccou-ELIS1JQV76R8"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
