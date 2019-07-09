resource "aws_iam_role" "tfs-srv-prod-artf-jfrog1-ec2-role" {
  name = "tfs-srv-prod-artf-jfrog1-ec2-role"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-prod-artf-jfrog1-ec2-role0" {
  role       = "${aws_iam_role.tfs-srv-prod-artf-jfrog1-ec2-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-prod-artf-jfrog1-s3-policy"
}
resource "aws_iam_role_policy_attachment" "tfs-srv-prod-artf-jfrog1-ec2-role1" {
  role       = "${aws_iam_role.tfs-srv-prod-artf-jfrog1-ec2-role.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/tfs-srv-ec2-base-policy"
}
