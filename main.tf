data "aws_caller_identity" "default" {}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.70.0"
}

locals {
  prefix    = "poc"
  s3_prefix = "${data.aws_caller_identity.default.account_id}-${local.prefix}"
}

module "prowler" {
  source                 = "./prowler"
  cloudwatch_logs_status = "ENABLED"
  s3_logs_status         = "ENABLED"
  prefix                 = local.prefix
  prowler_options        = "-f us-east-1 -c check12,check15,check16,extra73,extra764,extra760,organizations251,organizations252 -M html,json,text,junit-xml"
  notification_email     = var.notification_email
}
