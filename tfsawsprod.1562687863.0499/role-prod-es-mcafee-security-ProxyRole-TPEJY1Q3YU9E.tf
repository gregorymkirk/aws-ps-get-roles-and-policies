resource "aws_iam_role" "prod-es-mcafee-security-ProxyRole-TPEJY1Q3YU9E" {
  name = "prod-es-mcafee-security-ProxyRole-TPEJY1Q3YU9E"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
