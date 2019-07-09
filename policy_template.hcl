data "template_file" "NAME_policy_doc" {
  template = "${file("${path.module}/policydocs/POLICY_DOC")}"
}

resource "aws_iam_policy" "NAME" {
  name        = "NAME"
  path        = "PATH"
  description = "DESCRIPTION"
  policy      = "${data.template_file.NAME_policy_doc.rendered}"
}
