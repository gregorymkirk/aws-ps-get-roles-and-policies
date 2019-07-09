resource "aws_iam_role" "tfs-srv-gs-biid-redshift-role" {
  name = "tfs-srv-gs-biid-redshift-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"redshift.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-gs-biid-redshift-role0" {
  role       = "${aws_iam_role.tfs-srv-gs-biid-redshift-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-gs-biid-s3-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-gs-biid-redshift-role1" {
  role       = "${aws_iam_role.tfs-srv-gs-biid-redshift-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-gs-biid-s3-refresh-policy"
}
