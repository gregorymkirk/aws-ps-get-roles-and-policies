data "template_file" "tfs-prod-human-iam-admin-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-prod-human-iam-admin-policy.json")}"
}

resource "aws_iam_policy" "tfs-prod-human-iam-admin-policy" {
  name        = "tfs-prod-human-iam-admin-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-prod-human-iam-admin-policy_policy_doc.rendered}"
}
