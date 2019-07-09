resource "aws_iam_role" "tfs-srv-dev-avi-controller-role" {
  name = "tfs-srv-dev-avi-controller-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::865824340098:root"},"Action":"sts:AssumeRole","Condition":{}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-dev-avi-controller-role0" {
  role       = "${aws_iam_role.tfs-srv-dev-avi-controller-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-avi-controller-s3-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-dev-avi-controller-role1" {
  role       = "${aws_iam_role.tfs-srv-dev-avi-controller-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-avi-controller-ec2-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-dev-avi-controller-role2" {
  role       = "${aws_iam_role.tfs-srv-dev-avi-controller-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-avi-controller-iam-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-dev-avi-controller-role3" {
  role       = "${aws_iam_role.tfs-srv-dev-avi-controller-role.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-avi-controller-route53-policy"
}
