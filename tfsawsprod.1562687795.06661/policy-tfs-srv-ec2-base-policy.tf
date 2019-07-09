data "template_file" "tfs-srv-ec2-base-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfs-srv-ec2-base-policy.json")}"
}

resource "aws_iam_policy" "tfs-srv-ec2-base-policy" {
  name        = "tfs-srv-ec2-base-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfs-srv-ec2-base-policy_policy_doc.rendered}"
}
