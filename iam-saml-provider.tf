resource "aws_iam_saml_provider" "gsuite" {
  name                   = "GSuite"
  saml_metadata_document = var.metadata
}
