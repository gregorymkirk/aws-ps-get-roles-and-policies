data "template_file" "Jenkins-subprod-EC2RolePolicy_policy_doc" {
  template = "${file("${path.module}/policydocs/Jenkins-subprod-EC2RolePolicy.json")}"
}

resource "aws_iam_policy" "Jenkins-subprod-EC2RolePolicy" {
  name        = "Jenkins-subprod-EC2RolePolicy"
  path        = "/"
  description = ""
  policy      = "${data.template_file.Jenkins-subprod-EC2RolePolicy_policy_doc.rendered}"
}
