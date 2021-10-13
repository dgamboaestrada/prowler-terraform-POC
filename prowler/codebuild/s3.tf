locals {
  s3_prefix = "${data.aws_caller_identity.default.account_id}-${var.prefix}"
}

resource "aws_s3_bucket" "default" {
  bucket = "${local.s3_prefix}prowler-codebuild"
  acl    = "private"
  tags   = var.tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "default" {
  for_each = fileset("${path.module}/codebuild-source/", "*")
  bucket = aws_s3_bucket.default.id
  key = "codebuild-source/${each.value}"
  source = "${path.module}/codebuild-source/${each.value}"
  etag = filemd5("${path.module}/codebuild-source/${each.value}")
}
