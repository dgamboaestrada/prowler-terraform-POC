resource "aws_sns_topic" "default" {
  name = "codebuild-fail"
}

resource "aws_sns_topic_subscription" "default" {
  topic_arn = aws_sns_topic.default.arn
  protocol  = "email"
  endpoint  = var.email
}
