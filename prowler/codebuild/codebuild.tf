locals {
  log_group_name = "/aws/codebuild/${var.prefix}prowler"
}

resource "aws_codebuild_project" "default" {
  name          = "${var.prefix}prowler"
  description   = var.description
  build_timeout = var.build_timeout
  service_role  = aws_iam_role.default.arn

  artifacts {
    type     = "S3"
    location = aws_s3_bucket.default.bucket
    name     = "artifacts"
  }

  cache {
    type     = "S3"
    location = aws_s3_bucket.default.bucket
  }

  environment {
    compute_type                = var.compute_type
    image                       = var.codebuild_image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "PROWLER_OPTIONS"
      value = var.prowler_options
    }
  }

  logs_config {
    cloudwatch_logs {
      status      = var.cloudwatch_logs_status
      group_name  = local.log_group_name
      stream_name = "log-stream"
    }

    s3_logs {
      status   = var.s3_logs_status
      location = var.s3_logs_status == "ENABLED" ? "${aws_s3_bucket.default.id}/build-log" : null
    }
  }

  source {
    type      = "S3"
    location  = "${aws_s3_bucket.default.id}/codebuild-source/"
    buildspec = file("${path.module}/buildspec.yml")
  }

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "codebuild" {
  name              = local.log_group_name
  retention_in_days = var.logs_retention_in_days
  tags              = var.tags
}

resource "aws_codebuild_report_group" "default" {
  name = "${var.prefix}prowler-checks"
  type = "TEST"

  export_config {
    type = "NO_EXPORT"
  }
}
