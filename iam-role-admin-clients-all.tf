# This role (client-admin) allows switching to any client

resource "aws_iam_role" "clients_all_admin" {
  name                 = "client-admin"
  assume_role_policy   = "${data.aws_iam_policy_document.gsuite.json}"
  max_session_duration = "${var.role_max_session_duration}"
}

data "aws_iam_policy_document" "clients_all_admin_assume_policy" {
  statement {
    actions   = ["iam:ListAccountAliases"]
    resources = ["*"]
  }

  statement {
    actions = ["sts:AssumeRole"]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "clients_all_admin_assume" {
  name = "clients-all-assume-idp-admin"
  role = "${aws_iam_role.clients_all_admin.id}"

  policy = "${data.aws_iam_policy_document.clients_all_admin_assume_policy.json}"
}
