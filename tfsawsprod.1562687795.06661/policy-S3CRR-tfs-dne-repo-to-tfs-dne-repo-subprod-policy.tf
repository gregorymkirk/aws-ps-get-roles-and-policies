data "template_file" "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod-policy.json")}"
}

resource "aws_iam_policy" "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod-policy" {
  name        = "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod-policy_policy_doc.rendered}"
}
