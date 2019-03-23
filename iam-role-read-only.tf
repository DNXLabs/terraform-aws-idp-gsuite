resource "aws_iam_role" "read_only" {
  name               = "${var.org_name}-read-only"
  assume_role_policy = "${data.aws_iam_policy_document.gsuite.json}"
}

resource "aws_iam_role_policy" "read_only_assume" {
  name = "assume-idp-read-only"
  role = "${aws_iam_role.read_only.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sts:AssumeRole"
            ],
            "Resource": [
                "arn:aws:iam::*:role/${var.org_name}-*-read-only"
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
