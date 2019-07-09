resource "aws_iam_role" "tfsawssubprod-srv-commondev-redshift-role" {
  name = "tfsawssubprod-srv-commondev-redshift-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"redshift.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-srv-commondev-redshift-role0" {
  role       = "${aws_iam_role.tfsawssubprod-srv-commondev-redshift-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsawssubprod-srv-commondev-s3-policy"
}
