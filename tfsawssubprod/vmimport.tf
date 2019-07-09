resource "aws_iam_role" "vmimport" {
  name = "vmimport"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"vmie.amazonaws.com"},"Action":"sts:AssumeRole","Condition":{"StringEquals":{"sts:ExternalId":"vmimport"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "vmimport0" {
  role       = "${aws_iam_role.vmimport.id}"
  policy_arn = "arn:aws:iam::009754696474:policy/tfs-srv-avi-vmimport-policy"
}
