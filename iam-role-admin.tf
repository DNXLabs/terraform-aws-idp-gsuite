resource "aws_iam_role" "admin" {
  name                 = "${var.org_name}-admin"
  assume_role_policy   = "${data.aws_iam_policy_document.gsuite.json}"
  max_session_duration = "${var.role_max_session_duration}"
}

data "aws_iam_policy_document" "admin_policy" {
  statement {
    actions   = ["iam:ListAccountAliases"]
    resources = ["*"]
  }

  statement {
    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::*:role/${var.org_name}-*-admin",
      "arn:aws:iam::*:role/terraform-backend",
    ]
  }
}

resource "aws_iam_role_policy" "admin_assume" {
  name   = "assume-idp-admin"
  role   = "${aws_iam_role.admin.id}"
  policy = "${data.aws_iam_policy_document.admin_policy.json}"
}
