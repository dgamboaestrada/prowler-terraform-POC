data "aws_caller_identity" "default" {}

locals {
  prefix         = var.prefix == "" ? "" : "${var.prefix}-"
  s3_prefix      = "${data.aws_caller_identity.default.account_id}-${local.prefix}"
  log_group_name = "/aws/codebuild/${local.prefix}prowler"
}

module "cloudwatch_event" {
  source                 = "./cloudwatch-event"
  prefix                 = local.prefix
  codebuild_project_id   = aws_codebuild_project.default.id
  codebuild_project_arn  = aws_codebuild_project.default.arn
  schedule_expression    = "rate(1 hour)"
  logs_retention_in_days = var.logs_retention_in_days
  tags                   = var.tags
}
