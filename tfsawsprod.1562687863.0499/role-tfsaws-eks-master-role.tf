resource "aws_iam_role" "tfsaws-eks-master-role" {
  name = "tfsaws-eks-master-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"eks.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsaws-eks-master-role0" {
  role       = "${aws_iam_role.tfsaws-eks-master-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
resource "aws_iam_role_policy_attachment" "tfsaws-eks-master-role1" {
  role       = "${aws_iam_role.tfsaws-eks-master-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}
