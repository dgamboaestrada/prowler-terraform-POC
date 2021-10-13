resource "aws_cloudwatch_log_group" "default" {
  name              = "/aws/lambda/${var.prefix}prowler-codebuild-trigger"
  retention_in_days = var.logs_retention_in_days
  tags              = var.tags
}
