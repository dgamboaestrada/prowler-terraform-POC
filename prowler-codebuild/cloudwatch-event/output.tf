output "id" {
  description = "The name of the rule"
  value       = aws_cloudwatch_event_rule.default.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the rule"
  value       = aws_cloudwatch_event_rule.default.arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.default.function_name
}

output "lambda_arn" {
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function"
  value       = aws_lambda_function.default.arn
}

output "role_id" {
  value = aws_iam_role.default.id
}
