data "aws_caller_identity" "default" {}

locals {
  prefix = var.prefix == "" ? "" : "${var.prefix}-"
  s3_prefix = "${data.aws_caller_identity.default.account_id}-${local.prefix}"
}
