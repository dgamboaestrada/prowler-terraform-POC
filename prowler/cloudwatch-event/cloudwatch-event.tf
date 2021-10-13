resource "aws_cloudwatch_event_rule" "default" {
  name                = "${var.prefix}prowler-codebuild-trigger"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "default" {
  rule      = aws_cloudwatch_event_rule.default.name
  target_id = aws_cloudwatch_event_rule.default.name
  arn       = aws_lambda_function.default.arn
  input     = "{ \"ProjectName\": \"${var.codebuild_project_id}\" }"
}
