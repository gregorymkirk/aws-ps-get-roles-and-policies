data "template_file" "tfs_eks_admin_policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs_eks_admin_policy.json")}"
}

resource "aws_iam_policy" "tfs_eks_admin_policy" {
  name        = "tfs_eks_admin_policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs_eks_admin_policy_policy_doc.rendered}"
}
