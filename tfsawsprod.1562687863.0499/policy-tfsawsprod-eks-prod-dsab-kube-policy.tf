data "template_file" "tfsawsprod-eks-prod-dsab-kube-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfsawsprod-eks-prod-dsab-kube-policy.json")}"
}

resource "aws_iam_policy" "tfsawsprod-eks-prod-dsab-kube-policy" {
  name        = "tfsawsprod-eks-prod-dsab-kube-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfsawsprod-eks-prod-dsab-kube-policy_policy_doc.rendered}"
}
