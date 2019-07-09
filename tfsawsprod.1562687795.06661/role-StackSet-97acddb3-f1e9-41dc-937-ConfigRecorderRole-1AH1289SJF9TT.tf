resource "aws_iam_role" "StackSet-97acddb3-f1e9-41dc-937-ConfigRecorderRole-1AH1289SJF9TT" {
  name = "StackSet-97acddb3-f1e9-41dc-937-ConfigRecorderRole-1AH1289SJF9TT"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"config.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "StackSet-97acddb3-f1e9-41dc-937-ConfigRecorderRole-1AH1289SJF9TT0" {
  role       = "${aws_iam_role.StackSet-97acddb3-f1e9-41dc-937-ConfigRecorderRole-1AH1289SJF9TT.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}
