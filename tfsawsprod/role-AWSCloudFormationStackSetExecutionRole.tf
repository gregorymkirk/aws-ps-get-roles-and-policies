resource "aws_iam_role" "AWSCloudFormationStackSetExecutionRole" {
  name = "AWSCloudFormationStackSetExecutionRole"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::865824340098:root"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "AWSCloudFormationStackSetExecutionRole0" {
  role       = "${aws_iam_role.AWSCloudFormationStackSetExecutionRole.id}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
