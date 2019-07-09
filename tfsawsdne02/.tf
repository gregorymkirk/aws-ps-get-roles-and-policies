data "template_file" "tfsawsdne_network_admins_policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfsawsdne_network_admins_policy.json")}"
}

resource "aws_iam_policy" "tfsawsdne_network_admins_policy" {
  name        = "tfsawsdne_network_admins_policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfsawsdne_network_admins_policy_policy_doc.rendered}"
}
