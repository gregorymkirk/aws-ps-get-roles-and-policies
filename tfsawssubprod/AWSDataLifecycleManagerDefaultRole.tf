resource "aws_iam_role" "AWSDataLifecycleManagerDefaultRole" {
  name = "AWSDataLifecycleManagerDefaultRole"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"dlm.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/service-role/"
}
resource "aws_iam_role_policy_attachment" "AWSDataLifecycleManagerDefaultRole0" {
  role       = "${aws_iam_role.AWSDataLifecycleManagerDefaultRole.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSDataLifecycleManagerServiceRole"
}
