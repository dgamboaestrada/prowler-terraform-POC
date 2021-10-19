data "aws_iam_policy_document" "default" {
  statement {
    effect = "Allow"

    resources = ["arn:aws:logs:*:*:*"]

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
  }

  statement {
    effect = "Allow"

    resources = [
      var.codebuild_project_arn,
    ]

    actions = [
      "codebuild:StartBuild"
    ]
  }
}

