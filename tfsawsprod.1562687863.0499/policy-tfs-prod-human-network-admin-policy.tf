data "template_file" "tfs-prod-human-network-admin-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-prod-human-network-admin-policy.json")}"
}

resource "aws_iam_policy" "tfs-prod-human-network-admin-policy" {
  name        = "tfs-prod-human-network-admin-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-prod-human-network-admin-policy_policy_doc.rendered}"
}
