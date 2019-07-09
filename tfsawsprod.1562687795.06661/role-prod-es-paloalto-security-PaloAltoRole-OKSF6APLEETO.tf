resource "aws_iam_role" "prod-es-paloalto-security-PaloAltoRole-OKSF6APLEETO" {
  name = "prod-es-paloalto-security-PaloAltoRole-OKSF6APLEETO"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
