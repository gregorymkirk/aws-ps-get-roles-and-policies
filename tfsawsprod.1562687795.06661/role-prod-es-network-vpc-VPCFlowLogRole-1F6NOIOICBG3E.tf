resource "aws_iam_role" "prod-es-network-vpc-VPCFlowLogRole-1F6NOIOICBG3E" {
  name = "prod-es-network-vpc-VPCFlowLogRole-1F6NOIOICBG3E"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"vpc-flow-logs.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
