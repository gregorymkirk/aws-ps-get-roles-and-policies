data "template_file" "tfs-prod-human-monitoring-admin-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-prod-human-monitoring-admin-policy.json")}"
}

resource "aws_iam_policy" "tfs-prod-human-monitoring-admin-policy" {
  name        = "tfs-prod-human-monitoring-admin-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-prod-human-monitoring-admin-policy_policy_doc.rendered}"
}
