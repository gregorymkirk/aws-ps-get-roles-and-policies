resource "aws_iam_role" "tfs-srv-redshift-bigl-role" {
  name = "tfs-srv-redshift-bigl-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"redshift.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-redshift-bigl-role0" {
  role       = "${aws_iam_role.tfs-srv-redshift-bigl-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-gs-bigl-s3-policy"
}
