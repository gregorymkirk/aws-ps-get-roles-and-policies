resource "aws_iam_role" "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod" {
  name = "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod"

  #  permissions_boundary = "BOUNDARY"
  assume_role_policy = <<EOF
  "{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"s3.amazonaws.com"},"Action":"sts:AssumeRole"}]}"
  EOF

  path = "/"
}
resource "aws_iam_role_policy_attachment" "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod0" {
  role       = "${aws_iam_role.S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/service-role/s3crr_for_tfs-dne-repo_to_tfs-dne-repo-subprod"
}
resource "aws_iam_role_policy_attachment" "S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod1" {
  role       = "${aws_iam_role.S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod.id}"
  policy_arn = "arn:aws:iam::865824340098:policy/S3CRR-tfs-dne-repo-to-tfs-dne-repo-subprod-policy"
}
