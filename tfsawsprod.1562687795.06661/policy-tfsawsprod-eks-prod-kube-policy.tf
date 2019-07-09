data "template_file" "tfsawsprod-eks-prod-kube-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfsawsprod-eks-prod-kube-policy.json")}"
}

resource "aws_iam_policy" "tfsawsprod-eks-prod-kube-policy" {
  name        = "tfsawsprod-eks-prod-kube-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfsawsprod-eks-prod-kube-policy_policy_doc.rendered}"
}
