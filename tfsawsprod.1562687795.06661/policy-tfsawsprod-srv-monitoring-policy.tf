data "template_file" "tfsawsprod-srv-monitoring-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfsawsprod-srv-monitoring-policy.json")}"
}

resource "aws_iam_policy" "tfsawsprod-srv-monitoring-policy" {
  name        = "tfsawsprod-srv-monitoring-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfsawsprod-srv-monitoring-policy_policy_doc.rendered}"
}
