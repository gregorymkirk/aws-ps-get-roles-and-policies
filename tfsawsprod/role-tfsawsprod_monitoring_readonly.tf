resource "aws_iam_role" "tfsawsprod_monitoring_readonly" {
  name = "tfsawsprod_monitoring_readonly"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Federated":"arn:aws:iam::865824340098:saml-provider/Centrify"},"Action":"sts:AssumeRoleWithSAML","Condition":{"StringEquals":{"saml:aud":"https://signin.aws.amazon.com/saml"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_monitoring_readonly0" {
  role       = "${aws_iam_role.tfsawsprod_monitoring_readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
