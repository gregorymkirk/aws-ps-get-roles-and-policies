data "template_file" "tfs-srv-avi-controller-iam-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-avi-controller-iam-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-avi-controller-iam-policy" {
  name        = "tfs-srv-avi-controller-iam-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-avi-controller-iam-policy_policy_doc.rendered}"
}
