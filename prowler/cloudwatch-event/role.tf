resource "aws_iam_role" "default" {
  name = "${var.prefix}prowler-codebuild-trigger"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "default" {
  name   = "${var.prefix}prowler-codebuild-trigger"
  role   = aws_iam_role.default.id
  policy = data.aws_iam_policy_document.default.json
}
