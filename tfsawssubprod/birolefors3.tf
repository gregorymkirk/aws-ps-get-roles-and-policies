resource "aws_iam_role" "birolefors3" {
  name = "birolefors3"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "birolefors30" {
  role       = "${aws_iam_role.birolefors3.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-ec2-base-policy"
}
