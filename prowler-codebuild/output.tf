output "bucket" {
  value = aws_s3_bucket.default.bucket
}

output "bucket_id" {
  value = aws_s3_bucket.default.id
}

output "bucket_arn" {
  value = aws_s3_bucket.default.arn
}

output "bucket_domain_name" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "role_id" {
  value = aws_iam_role.default.id
}

output "role_arn" {
  value = aws_iam_role.default.arn
}

output "project_id" {
  value = aws_codebuild_project.default.id
}

output "name" {
  value = aws_codebuild_project.default.name
}

output "arn" {
  value = aws_codebuild_project.default.arn
}
