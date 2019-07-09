resource "aws_iam_role" "tfsawssubprod_eks_admins" {
  name = "tfsawssubprod_eks_admins"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Federated":"arn:aws:iam::009754696474:saml-provider/Centrify"},"Action":"sts:AssumeRoleWithSAML","Condition":{"StringEquals":{"saml:aud":"https://signin.aws.amazon.com/saml"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod_eks_admins0" {
  role       = "${aws_iam_role.tfsawssubprod_eks_admins.id}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod_eks_admins1" {
  role       = "${aws_iam_role.tfsawssubprod_eks_admins.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs_base_admin_policy"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod_eks_admins2" {
  role       = "${aws_iam_role.tfsawssubprod_eks_admins.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs_eks_admin_policy"
}
