data "template_file" "tfs-srv-avi-controller-assume-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-avi-controller-assume-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-avi-controller-assume-policy" {
  name        = "tfs-srv-avi-controller-assume-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-avi-controller-assume-policy_policy_doc.rendered}"
}
