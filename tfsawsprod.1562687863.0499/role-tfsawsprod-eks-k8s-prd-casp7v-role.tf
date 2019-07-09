resource "aws_iam_role" "tfsawsprod-eks-k8s-prd-casp7v-role" {
  name = "tfsawsprod-eks-k8s-prd-casp7v-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-eks-k8s-prd-casp7v-role0" {
  role       = "${aws_iam_role.tfsawsprod-eks-k8s-prd-casp7v-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfsawsprod-eks-prod-kube-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-eks-k8s-prd-casp7v-role1" {
  role       = "${aws_iam_role.tfsawsprod-eks-k8s-prd-casp7v-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfsaws-ec2-base-policy"
}
