resource "aws_iam_role" "admin" {
  name               = "${var.org_name}-admin"
  assume_role_policy = "${data.aws_iam_policy_document.gsuite.json}"
}

resource "aws_iam_role_policy" "admin_assume" {
  name = "assume-idp-admin"
  role = "${aws_iam_role.admin.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::*:role/${var.org_name}-*-admin"
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
