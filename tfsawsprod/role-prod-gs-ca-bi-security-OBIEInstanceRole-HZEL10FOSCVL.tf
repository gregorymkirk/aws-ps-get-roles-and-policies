resource "aws_iam_role" "prod-gs-ca-bi-security-OBIEInstanceRole-HZEL10FOSCVL" {
  name = "prod-gs-ca-bi-security-OBIEInstanceRole-HZEL10FOSCVL"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "prod-gs-ca-bi-security-OBIEInstanceRole-HZEL10FOSCVL0" {
  role       = "${aws_iam_role.prod-gs-ca-bi-security-OBIEInstanceRole-HZEL10FOSCVL.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
resource "aws_iam_role_policy_attachment" "prod-gs-ca-bi-security-OBIEInstanceRole-HZEL10FOSCVL1" {
  role       = "${aws_iam_role.prod-gs-ca-bi-security-OBIEInstanceRole-HZEL10FOSCVL.id}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonSSMMaintenanceWindowRole"
}
