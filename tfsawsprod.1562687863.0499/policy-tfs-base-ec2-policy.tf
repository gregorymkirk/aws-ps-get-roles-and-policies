data "template_file" "tfs-base-ec2-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-base-ec2-policy.json")}"
}

resource "aws_iam_policy" "tfs-base-ec2-policy" {
  name        = "tfs-base-ec2-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-base-ec2-policy_policy_doc.rendered}"
}
