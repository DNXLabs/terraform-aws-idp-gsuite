resource "aws_iam_role" "billing" {
  name                 = "${var.org_name}-billing"
  assume_role_policy   = "${data.aws_iam_policy_document.gsuite.json}"
  max_session_duration = "${var.role_max_session_duration}"
}

data "aws_iam_policy_document" "billing_policy" {
  statement {
    actions   = ["iam:ListAccountAliases"]
    resources = ["*"]
  }

  statement {
    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::*:role/${var.org_name}-billing",
    ]
  }
}

resource "aws_iam_role_policy" "billing_assume" {
  name   = "assume-idp-billing"
  role   = "${aws_iam_role.billing.id}"
  policy = "${data.aws_iam_policy_document.billing_policy.json}"
}
