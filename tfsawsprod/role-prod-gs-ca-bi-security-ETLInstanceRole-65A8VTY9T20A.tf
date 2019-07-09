resource "aws_iam_role" "prod-gs-ca-bi-security-ETLInstanceRole-65A8VTY9T20A" {
  name = "prod-gs-ca-bi-security-ETLInstanceRole-65A8VTY9T20A"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "prod-gs-ca-bi-security-ETLInstanceRole-65A8VTY9T20A0" {
  role       = "${aws_iam_role.prod-gs-ca-bi-security-ETLInstanceRole-65A8VTY9T20A.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-gs-bicn-s3-refresh-policy"
}
