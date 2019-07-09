resource "aws_iam_role" "tfsawsprod-srv-backup-role" {
  name = "tfsawsprod-srv-backup-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"backup.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-srv-backup-role0" {
  role       = "${aws_iam_role.tfsawsprod-srv-backup-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}
resource "aws_iam_role_policy_attachment" "tfsawsprod-srv-backup-role1" {
  role       = "${aws_iam_role.tfsawsprod-srv-backup-role.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}
