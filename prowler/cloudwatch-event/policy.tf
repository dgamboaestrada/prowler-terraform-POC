data "aws_iam_policy_document" "cloudwatch_mapper_records_table" {
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

