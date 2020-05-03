resource "aws_iam_role" "audit" {
  name                 = "${var.org_name}-audit"
  assume_role_policy   = data.aws_iam_policy_document.gsuite.json
  max_session_duration = var.role_max_session_duration
}

data "aws_iam_policy_document" "audit_policy" {
  statement {
    actions   = ["iam:ListAccountAliases"]
    resources = ["*"]
  }

  statement {
    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::*:role/${var.org_name}-audit",
    ]
  }
}

resource "aws_iam_role_policy" "audit_assume" {
  name   = "assume-idp-audit"
  role   = aws_iam_role.audit.id
  policy = data.aws_iam_policy_document.audit_policy.json
}

resource "aws_iam_group" "audit" {
  name = "${var.org_name}-audit"
}

resource "aws_iam_group_policy" "audit_assume" {
  name   = "assume-idp-audit-group"
  group  = aws_iam_group.audit.name
  policy = data.aws_iam_policy_document.audit_policy.json
}
