data "template_file" "tfs-srv-gs-biid-s3-refresh-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-gs-biid-s3-refresh-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-gs-biid-s3-refresh-policy" {
  name        = "tfs-srv-gs-biid-s3-refresh-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-gs-biid-s3-refresh-policy_policy_doc.rendered}"
}
