resource "aws_iam_role" "tfsawssubprod-eks-dev-mgmt-role" {
  name = "tfsawssubprod-eks-dev-mgmt-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-eks-dev-mgmt-role0" {
  role       = "${aws_iam_role.tfsawssubprod-eks-dev-mgmt-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsawssubprod-eks-dev-mgmt"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-eks-dev-mgmt-role1" {
  role       = "${aws_iam_role.tfsawssubprod-eks-dev-mgmt-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsaws-ec2-base-policy"
}
