resource "aws_iam_role" "tfs-srv-es-qualys-connector-role" {
  name = "tfs-srv-es-qualys-connector-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"AWS":"arn:aws:iam::805950163170:root"},"Action":"sts:AssumeRole","Condition":{"StringEquals":{"sts:ExternalId":"1542742914098"}}}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-es-qualys-connector-role0" {
  role       = "${aws_iam_role.tfs-srv-es-qualys-connector-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
