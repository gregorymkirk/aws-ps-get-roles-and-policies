resource "aws_iam_role" "tfs-srv-gs-redshift-bicn-role" {
  name = "tfs-srv-gs-redshift-bicn-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"redshift.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-gs-redshift-bicn-role0" {
  role       = "${aws_iam_role.tfs-srv-gs-redshift-bicn-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-gs-bicn-s3-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-gs-redshift-bicn-role1" {
  role       = "${aws_iam_role.tfs-srv-gs-redshift-bicn-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-gs-bicn-s3-refresh-policy"
}
