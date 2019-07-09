resource "aws_iam_role" "tfs-srv-gs-bitl-redshift-role" {
  name = "tfs-srv-gs-bitl-redshift-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"redshift.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-gs-bitl-redshift-role0" {
  role       = "${aws_iam_role.tfs-srv-gs-bitl-redshift-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-gs-bitl-s3-refresh-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-gs-bitl-redshift-role1" {
  role       = "${aws_iam_role.tfs-srv-gs-bitl-redshift-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-gs-bitl-s3-policy"
}
