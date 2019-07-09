data "template_file" "Avi-S3-Policy_policy_doc" {
  template = "${file("${path.module}/policydocs/Avi-S3-Policy.json")}"
}

resource "aws_iam_policy" "Avi-S3-Policy" {
  name        = "Avi-S3-Policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.Avi-S3-Policy_policy_doc.rendered}"
}
