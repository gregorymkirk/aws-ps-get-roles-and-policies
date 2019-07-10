### Read the inline policy from a file and attach it to the role

data "local_file" "ROLE-POLICY" {
  filename = "${file("${path.module}/inlinepolicydoc/POLICY.json")}"
}

resource "aws_iam_role_policy" "ATTACH" {
  role   = "${aws_iam_role.ROLE.id}"
  policy = "${data.local_file.ROLE-POLICY.content}"
}
