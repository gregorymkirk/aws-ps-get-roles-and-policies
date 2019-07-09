resource "aws_iam_role" "tfsawssubprod-vpcflowlogs-role" {
  name = "tfsawssubprod-vpcflowlogs-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"vpc-flow-logs.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
