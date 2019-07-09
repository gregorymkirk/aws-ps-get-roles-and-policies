data "template_file" "tfs-srv-sitescope-rds-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-sitescope-rds-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-sitescope-rds-policy" {
  name        = "tfs-srv-sitescope-rds-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-sitescope-rds-policy_policy_doc.rendered}"
}
