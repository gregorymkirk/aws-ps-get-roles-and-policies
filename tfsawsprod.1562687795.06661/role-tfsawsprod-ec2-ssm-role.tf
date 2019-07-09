resource "aws_iam_role" "tfsawsprod-ec2-ssm-role" {
  name = "tfsawsprod-ec2-ssm-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-ec2-ssm-role0" {
  role       = "${aws_iam_role.tfsawsprod-ec2-ssm-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-ec2-ssm-role1" {
  role       = "${aws_iam_role.tfsawsprod-ec2-ssm-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSSMMaintenanceWindowRole"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-ec2-ssm-role2" {
  role       = "${aws_iam_role.tfsawsprod-ec2-ssm-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-base-ec2-policy"
}
