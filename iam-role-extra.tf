resource "aws_iam_role" "extra" {
  count                = "${length(var.extra_roles)}"
  name                 = "${var.org_name}-${var.extra_roles[count.index]}"
  assume_role_policy   = "${data.aws_iam_policy_document.gsuite.json}"
  max_session_duration = "${var.role_max_session_duration}"
}

data "aws_iam_policy_document" "extra_policy" {
  count = "${length(var.extra_roles)}"

  statement {
    actions   = ["iam:ListAccountAliases"]
    resources = ["*"]
  }

  statement {
    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::*:role/${var.org_name}-*-${var.extra_roles[count.index]}",
      "arn:aws:iam::*:role/terraform-backend",
    ]
  }
}

resource "aws_iam_role_policy" "extra_assume" {
  count  = "${length(var.extra_roles)}"
  name   = "assume-idp-${var.extra_roles[count.index]}"
  role   = "${aws_iam_role.extra.*.id[count.index]}"
  policy = "${data.aws_iam_policy_document.extra_policy.*.json[count.index]}"
}
