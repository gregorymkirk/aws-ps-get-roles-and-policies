resource "aws_iam_role" "tfsawsprod_compute_admins" {
  name = "tfsawsprod_compute_admins"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Federated":"arn:aws:iam::865824340098:saml-provider/Centrify"},"Action":"sts:AssumeRoleWithSAML","Condition":{"StringEquals":{"saml:aud":"https://signin.aws.amazon.com/saml"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_compute_admins0" {
  role       = "${aws_iam_role.tfsawsprod_compute_admins.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_compute_admins1" {
  role       = "${aws_iam_role.tfsawsprod_compute_admins.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-prod-human-compute-admin-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod_compute_admins2" {
  role       = "${aws_iam_role.tfsawsprod_compute_admins.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-prod-human-base-admin-policy"
}
