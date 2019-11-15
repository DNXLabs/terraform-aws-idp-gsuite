resource "aws_iam_role" "clients_all_read_only" {
  name                 = "client-read-only"
  assume_role_policy   = "${data.aws_iam_policy_document.gsuite.json}"
  max_session_duration = "${var.role_max_session_duration}"
}

resource "aws_iam_role_policy" "clients_all_read_only_assume" {
  name = "clients-all-assume-idp-read-only"
  role = "${aws_iam_role.clients_all_read_only.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "iam:ListAccountAliases"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        }
    ]
}
EOF
}
