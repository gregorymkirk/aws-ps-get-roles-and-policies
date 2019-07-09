data "template_file" "tfs-srv-avi-controller-s3-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-avi-controller-s3-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-avi-controller-s3-policy" {
  name        = "tfs-srv-avi-controller-s3-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-avi-controller-s3-policy_policy_doc.rendered}"
}
