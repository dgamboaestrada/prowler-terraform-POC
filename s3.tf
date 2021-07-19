resource "aws_s3_bucket" "test1" {
  bucket = "${local.s3_prefix}-test1"
  acl    = "public-read"
  tags   = {
    Project = "Prowler",
    Private = "false",
    Encripted = "true",
    TestStatus = "false"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "test2" {
  bucket = "${local.s3_prefix}-test2"
  acl    = "public-read"
  tags   = {
    Project = "Prowler",
    Private = "false",
    Encripted = "false",
    TestStatus = "false"
  }
}

resource "aws_s3_bucket" "test3" {
  bucket = "${local.s3_prefix}-test3"
  acl    = "private"
  tags   = {
    Project = "Prowler",
    Private = "true",
    Encripted = "false",
    TestStatus = "false"
  }
}

resource "aws_s3_bucket" "test4" {
  bucket = "${local.s3_prefix}-test4"
  acl    = "private"
  tags   = {
    Project = "Prowler",
    Private = "true",
    Encripted = "true",
    TestStatus = "true"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
