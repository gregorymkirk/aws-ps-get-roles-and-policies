resource "aws_iam_role" "Jenkins-Cluster-Role" {
  name = "Jenkins-Cluster-Role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
