resource "aws_iam_role" "default" {
  name = "${local.prefix}-lambda-test"

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
      "Sid": "LambdaProwler"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "default" {
  name   = "${local.prefix}-lambda-test"
  role   = aws_iam_role.default.id
  policy = data.aws_iam_policy_document.default.json
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
}

resource "aws_lambda_function" "default" {
  filename         = data.archive_file.lambda_src.output_path
  source_code_hash = filebase64sha256(data.archive_file.lambda_src.output_path)
  function_name    = "${local.prefix}-test"
  handler          = "index.handler"
  runtime          = "nodejs12.x"
  role             = aws_iam_role.default.arn
  tags             = {
    Project = "Prowler",
    TestStatus = "false"
  }
}

data "archive_file" "lambda_src" {
  type        = "zip"
  source_dir  = "${path.module}/lambda-src/"
  output_path = "/tmp/lambda_src.zip"
}
