## attach a managed policy to a role

resource "aws_iam_role_policy_attachment" "ATTACH" {
  role       = "${aws_iam_role.ROLE.id}"
  policy_arn = "POLICY"
}
