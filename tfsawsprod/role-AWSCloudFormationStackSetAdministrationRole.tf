resource "aws_iam_role" "AWSCloudFormationStackSetAdministrationRole" {
  name = "AWSCloudFormationStackSetAdministrationRole"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"cloudformation.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
