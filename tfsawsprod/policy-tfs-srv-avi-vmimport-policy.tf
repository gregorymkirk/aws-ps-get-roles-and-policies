data "template_file" "tfs-srv-avi-vmimport-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-avi-vmimport-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-avi-vmimport-policy" {
  name        = "tfs-srv-avi-vmimport-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-avi-vmimport-policy_policy_doc.rendered}"
}
