resource "aws_iam_role" "tfsawssubprod-dev-inpdfb-s3-role" {
  name = "tfsawssubprod-dev-inpdfb-s3-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-dev-inpdfb-s3-role0" {
  role       = "${aws_iam_role.tfsawssubprod-dev-inpdfb-s3-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsaws-ec2-base-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-dev-inpdfb-s3-role1" {
  role       = "${aws_iam_role.tfsawssubprod-dev-inpdfb-s3-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsawssubprod-dev-inpdfb-s3eip-policy"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod-dev-inpdfb-s3-role2" {
  role       = "${aws_iam_role.tfsawssubprod-dev-inpdfb-s3-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfsawssubprod-dev-inpdfb-s3-policy"
}
