resource "aws_iam_role" "clients_read_only" {
  count                = length(var.clients)
  name                 = "${var.clients[count.index]}-read-only"
  assume_role_policy   = data.aws_iam_policy_document.gsuite.json
  max_session_duration = var.role_max_session_duration
}

resource "aws_iam_role_policy" "clients_read_only_assume" {
  count = length(var.clients)
  name  = "clients-assume-idp-read-only-${var.clients[count.index]}"
  role  = aws_iam_role.clients_read_only[count.index].id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::*:role/${var.org_name}-read-only",
                "arn:aws:iam::*:role/${var.clients[count.index]}-*-read-only"
            ],
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
