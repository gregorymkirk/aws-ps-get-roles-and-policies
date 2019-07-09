data "template_file" "tfsawsprod-eks-prod-admin-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfsawsprod-eks-prod-admin-policy.json")}"
}

resource "aws_iam_policy" "tfsawsprod-eks-prod-admin-policy" {
  name        = "tfsawsprod-eks-prod-admin-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfsawsprod-eks-prod-admin-policy_policy_doc.rendered}"
}
