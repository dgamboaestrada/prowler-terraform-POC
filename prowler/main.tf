data "aws_caller_identity" "default" {}

locals {
  prefix         = var.prefix == "" ? "" : "${var.prefix}"
  s3_prefix      = "${data.aws_caller_identity.default.account_id}-${local.prefix}"
  log_group_name = "/aws/codebuild/${local.prefix}prowler"
}

module "cloudwatch_event" {
  source                 = "./cloudwatch-event"
  prefix                 = local.prefix
  codebuild_project_id   = module.codebuild.id
  codebuild_project_arn  = module.codebuild.arn
  schedule_expression    = "rate(24 hours)"
  logs_retention_in_days = var.logs_retention_in_days
  tags                   = var.tags
}

module "notifications" {
  source                 = "./notifications"
  prefix                 = local.prefix
  codebuild_project_name = module.codebuild.name
  email                  = var.notification_email
  tags                   = var.tags
}

module "codebuild" {
  source                 = "./codebuild"
  cloudwatch_logs_status = "ENABLED"
  s3_logs_status         = "ENABLED"
  prefix                 = local.prefix
  prowler_options        = var.prowler_options
  codebuild_fail_lamba_invoke_arn = var.codebuild_fail_lamba_invoke_arn
  codebuild_fail_lamba_invoke_id = var.codebuild_fail_lamba_invoke_id
}
