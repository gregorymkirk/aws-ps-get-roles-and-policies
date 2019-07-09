resource "aws_iam_role" "ROLE" {
  name = "ROLE"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "ASSUME"
  EOF

  path = "PATH"
}
