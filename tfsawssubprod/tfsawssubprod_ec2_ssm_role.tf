resource "aws_iam_role" "tfsawssubprod_ec2_ssm_role" {
  name = "tfsawssubprod_ec2_ssm_role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawssubprod_ec2_ssm_role0" {
  role       = "${aws_iam_role.tfsawssubprod_ec2_ssm_role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs_base_ec2_policy"
}
