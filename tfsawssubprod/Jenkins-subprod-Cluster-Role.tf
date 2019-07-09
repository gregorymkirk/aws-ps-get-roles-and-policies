resource "aws_iam_role" "Jenkins-subprod-Cluster-Role" {
  name = "Jenkins-subprod-Cluster-Role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "Jenkins-subprod-Cluster-Role0" {
  role       = "${aws_iam_role.Jenkins-subprod-Cluster-Role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/Jenkins-subprod-EC2_Invoke_Lambda"
}
resource "aws_iam_role_policy_attachment" "Jenkins-subprod-Cluster-Role1" {
  role       = "${aws_iam_role.Jenkins-subprod-Cluster-Role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/Jenkins-subprod-EC2RolePolicy"
}
