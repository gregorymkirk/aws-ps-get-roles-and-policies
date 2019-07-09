resource "aws_iam_role" "tfs-srv-ec2-base-role" {
  name = "tfs-srv-ec2-base-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-ec2-base-role0" {
  role       = "${aws_iam_role.tfs-srv-ec2-base-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-ec2-base-policy"
}
