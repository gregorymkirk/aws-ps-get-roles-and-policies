resource "aws_iam_role" "eks-prd-fgsc-worker-role" {
  name = "eks-prd-fgsc-worker-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "eks-prd-fgsc-worker-role0" {
  role       = "${aws_iam_role.eks-prd-fgsc-worker-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfsaws-ec2-base-policy"
}
resource "aws_iam_role_policy_attachment" "eks-prd-fgsc-worker-role1" {
  role       = "${aws_iam_role.eks-prd-fgsc-worker-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
resource "aws_iam_role_policy_attachment" "eks-prd-fgsc-worker-role2" {
  role       = "${aws_iam_role.eks-prd-fgsc-worker-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
resource "aws_iam_role_policy_attachment" "eks-prd-fgsc-worker-role3" {
  role       = "${aws_iam_role.eks-prd-fgsc-worker-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
