resource "aws_iam_role" "aws-ec2-spot-fleet-tagging-role" {
  name = "aws-ec2-spot-fleet-tagging-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"spotfleet.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "aws-ec2-spot-fleet-tagging-role0" {
  role       = "${aws_iam_role.aws-ec2-spot-fleet-tagging-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetTaggingRole"
}
