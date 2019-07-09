resource "aws_iam_role" "tfsawsprod-gsid-bi-etl-role" {
  name = "tfsawsprod-gsid-bi-etl-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":["redshift.amazonaws.com","ec2.amazonaws.com"]},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-gsid-bi-etl-role0" {
  role       = "${aws_iam_role.tfsawsprod-gsid-bi-etl-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-gs-biid-s3-refresh-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-gsid-bi-etl-role1" {
  role       = "${aws_iam_role.tfsawsprod-gsid-bi-etl-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-prod-gsid-bi-s3access-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-gsid-bi-etl-role2" {
  role       = "${aws_iam_role.tfsawsprod-gsid-bi-etl-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-base-ec2-policy"
}
