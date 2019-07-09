data "template_file" "tfsaws-ec2-base-policy_policy_doc" {
  template = "${file("${path.module}/policydocs/tfsaws-ec2-base-policy.json")}"
}

resource "aws_iam_policy" "tfsaws-ec2-base-policy" {
  name        = "tfsaws-ec2-base-policy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.tfsaws-ec2-base-policy_policy_doc.rendered}"
}
