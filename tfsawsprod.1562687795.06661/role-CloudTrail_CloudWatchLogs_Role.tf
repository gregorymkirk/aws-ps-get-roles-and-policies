resource "aws_iam_role" "CloudTrail_CloudWatchLogs_Role" {
  name = "CloudTrail_CloudWatchLogs_Role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"cloudtrail.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
