resource "aws_iam_role_policy" "default" {
  role   = aws_iam_role.default.name
  policy = data.aws_iam_policy_document.default.json
}

resource "aws_iam_role_policy_attachment" "security_audit" {
  role       = aws_iam_role.default.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_iam_role_policy_attachment" "view_only_access" {
  role       = aws_iam_role.default.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

  statement {
    actions = [
      "dax:ListTables",
      "ds:ListAuthorizedApplications",
      "ds:DescribeRoles",
      "ec2:GetEbsEncryptionByDefault",
      "ecr:Describe*",
      "support:Describe*",
      "tag:GetTagKeys",
      "lambda:GetFunction",
      "securityhub:BatchImportFindings",
      "securityhub:GetFindings",
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.default.arn,
      "${aws_s3_bucket.default.arn}/*",
    ]
  }
}
