resource "aws_iam_role" "SSMCohesityCloudEdition0SCKX8ZBG4293XL5" {
  name = "SSMCohesityCloudEdition0SCKX8ZBG4293XL5"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2008-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"workspaces.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
