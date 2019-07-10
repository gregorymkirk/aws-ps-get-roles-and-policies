#### - Create the role with the assume role policy

data "local_file" "assume_role_policy-ROLE" {
  filename = "${file("${path.module}/inlinepolicydoc/ASSUME")}"
}

resource "aws_iam_role" "ROLE" {
  name               = "ROLE"
  assume_role_policy = "${data.local_file.assume_role_policy-ROLE.content}"
  path               = "PATH"
}
