resource "aws_iam_role" "tfsawssubprod-dev-zuul-role" {
  name = "tfsawssubprod-dev-zuul-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-dev-zuul-role0" {
  role       = "${aws_iam_role.tfsawssubprod-dev-zuul-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsaws-ec2-base-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-dev-zuul-role1" {
  role       = "${aws_iam_role.tfsawssubprod-dev-zuul-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsawssubprod-dev-zuul-s3"
}
