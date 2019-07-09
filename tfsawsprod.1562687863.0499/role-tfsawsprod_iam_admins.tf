resource "aws_iam_role" "tfsawsprod_iam_admins" {
  name = "tfsawsprod_iam_admins"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Federated":"arn:aws:iam::865824340098:saml-provider/Centrify"},"Action":"sts:AssumeRoleWithSAML","Condition":{"StringEquals":{"saml:aud":"https://signin.aws.amazon.com/saml"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_iam_admins0" {
  role       = "${aws_iam_role.tfsawsprod_iam_admins.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-prod-human-iam-admin-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_iam_admins1" {
  role       = "${aws_iam_role.tfsawsprod_iam_admins.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_iam_admins2" {
  role       = "${aws_iam_role.tfsawsprod_iam_admins.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-prod-human-base-admin-policy"
}
