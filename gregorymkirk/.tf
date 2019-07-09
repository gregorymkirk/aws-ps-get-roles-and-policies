data "template_file" "tfs_monitoring_admin_policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs_monitoring_admin_policy.json")}"
}

resource "aws_iam_policy" "tfs_monitoring_admin_policy" {
  name        = "tfs_monitoring_admin_policy"
  path        = "/core/"
  description = ""
  policy      = "${data.template_file.tfs_monitoring_admin_policy_policy_doc.rendered}"
}
