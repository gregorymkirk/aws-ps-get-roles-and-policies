resource "aws_iam_role" "cloudsync-databroker-eval-DataBrokerIamRole-BEMGWB0SCPM" {
  name = "cloudsync-databroker-eval-DataBrokerIamRole-BEMGWB0SCPM"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
