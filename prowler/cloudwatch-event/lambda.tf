data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/lambda-src/"
  output_path = "/tmp/${var.prefix}lambda-trigger.zip"
}

resource "aws_lambda_function" "default" {
  filename         = data.archive_file.lambda.output_path
  function_name    = "${var.prefix}prowler-codebuild-trigger"
  role             = aws_iam_role.default.arn
  handler          = "main.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.lambda.output_path)
  runtime          = "python3.8"
  timeout          = 3

  depends_on = [
    aws_cloudwatch_log_group.default,
  ]
}

resource "aws_lambda_permission" "defautl" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.default.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.default.arn
}
