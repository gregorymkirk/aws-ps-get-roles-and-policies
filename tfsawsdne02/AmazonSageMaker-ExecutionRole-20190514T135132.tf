resource "aws_iam_role" "AmazonSageMaker-ExecutionRole-20190514T135132" {
  name = "AmazonSageMaker-ExecutionRole-20190514T135132"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
