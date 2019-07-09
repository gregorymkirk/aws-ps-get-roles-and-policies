resource "aws_iam_role" "prod-gs-ca-network-vpc-VPCFlowLogRole-1DDUCU1EDS2SO" {
  name = "prod-gs-ca-network-vpc-VPCFlowLogRole-1DDUCU1EDS2SO"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"vpc-flow-logs.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
