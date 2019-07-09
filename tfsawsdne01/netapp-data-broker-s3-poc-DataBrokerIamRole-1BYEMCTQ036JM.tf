resource "aws_iam_role" "netapp-data-broker-s3-poc-DataBrokerIamRole-1BYEMCTQ036JM" {
  name = "netapp-data-broker-s3-poc-DataBrokerIamRole-1BYEMCTQ036JM"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
