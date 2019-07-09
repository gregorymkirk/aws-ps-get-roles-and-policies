data "template_file" "s3crr_for_tfs-dne-repo_to_tfs-dne-repo-subprod_policy_doc" {
  template = "${file("${path.module}/policydocs/s3crr_for_tfs-dne-repo_to_tfs-dne-repo-subprod.json")}"
}

resource "aws_iam_policy" "s3crr_for_tfs-dne-repo_to_tfs-dne-repo-subprod" {
  name        = "s3crr_for_tfs-dne-repo_to_tfs-dne-repo-subprod"
  path        = "/service-role/"
  description = ""
  policy      = "${data.template_file.s3crr_for_tfs-dne-repo_to_tfs-dne-repo-subprod_policy_doc.rendered}"
}
