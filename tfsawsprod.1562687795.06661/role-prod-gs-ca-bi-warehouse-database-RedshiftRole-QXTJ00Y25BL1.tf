resource "aws_iam_role" "prod-gs-ca-bi-warehouse-database-RedshiftRole-QXTJ00Y25BL1" {
  name = "prod-gs-ca-bi-warehouse-database-RedshiftRole-QXTJ00Y25BL1"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"redshift.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "prod-gs-ca-bi-warehouse-database-RedshiftRole-QXTJ00Y25BL10" {
  role       = "${aws_iam_role.prod-gs-ca-bi-warehouse-database-RedshiftRole-QXTJ00Y25BL1.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-gs-bicn-s3-refresh-policy"
}
