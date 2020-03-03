# This role (<name>-admin) allows switching just to a specific client

resource "aws_iam_role" "clients_admin" {
  count                = length(var.clients)
  name                 = "${var.clients[count.index]}-admin"
  assume_role_policy   = data.aws_iam_policy_document.gsuite.json
  max_session_duration = var.role_max_session_duration
}

resource "aws_iam_role_policy" "clients_admin_assume" {
  count = length(var.clients)
  name  = "clients-assume-idp-admin-${var.clients[count.index]}"
  role  = aws_iam_role.clients_admin[count.index].id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::*:role/${var.clients[count.index]}-*-admin",
                "arn:aws:iam::*:role/terraform-backend"
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
