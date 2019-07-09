resource "aws_iam_role" "vmimport-chsty-5353575259725652-7-us-east-1" {
  name = "vmimport-chsty-5353575259725652-7-us-east-1"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
