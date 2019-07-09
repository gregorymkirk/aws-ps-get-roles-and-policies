data "template_file" "tfs-prod-gsid-bi-s3access-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-prod-gsid-bi-s3access-policy.json")}"
}

resource "aws_iam_policy" "tfs-prod-gsid-bi-s3access-policy" {
  name        = "tfs-prod-gsid-bi-s3access-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-prod-gsid-bi-s3access-policy_policy_doc.rendered}"
}
