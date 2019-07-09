resource "aws_iam_role" "subprod-commondev-bi-security-etl" {
  name = "subprod-commondev-bi-security-etl"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "subprod-commondev-bi-security-etl0" {
  role       = "${aws_iam_role.subprod-commondev-bi-security-etl.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs_base_ec2_policy"
}
