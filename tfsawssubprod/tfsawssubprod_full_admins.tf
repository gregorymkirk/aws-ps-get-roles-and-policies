resource "aws_iam_role" "tfsawssubprod_full_admins" {
  name = "tfsawssubprod_full_admins"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Federated":"arn:aws:iam::009754696474:saml-provider/Centrify"},"Action":"sts:AssumeRoleWithSAML","Condition":{"StringEquals":{"SAML:aud":"https://signin.aws.amazon.com/saml"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod_full_admins0" {
  role       = "${aws_iam_role.tfsawssubprod_full_admins.id}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
