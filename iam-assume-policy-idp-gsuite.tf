data "aws_iam_policy_document" "gsuite" {
  statement {
    principals {
      type = "Federated"

      identifiers = [
        "${aws_iam_saml_provider.gsuite.arn}",
      ]
    }

    actions = [
      "sts:AssumeRoleWithSAML",
    ]

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"

      values = [
        "https://signin.aws.amazon.com/saml",
      ]
    }
  }
}
