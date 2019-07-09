resource "aws_iam_role" "tfsawssubprod-redlock-readonly" {
  name = "tfsawssubprod-redlock-readonly"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::188619942792:root"},"Action":"sts:AssumeRole","Condition":{"StringEquals":{"sts:ExternalId":"Y03ng869MElnMY0QZ2Np"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-redlock-readonly0" {
  role       = "${aws_iam_role.tfsawssubprod-redlock-readonly.id}"
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
