resource "aws_cloudwatch_event_rule" "default" {
  name                = "${var.prefix}prowler-codebuild-fail"
  event_pattern = <<EOF
{
  "source": [
    "aws.codebuild"
  ],
  "detail-type": [
    "CodeBuild Build State Change"
  ],
  "detail": {
    "project-name": [
      "${var.codebuild_project_name}"
    ],
    "build-status": [
      "FAILED"
    ]
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "default" {
  rule      = aws_cloudwatch_event_rule.default.id
  arn       = aws_sns_topic.default.arn

  input_transformer {
    input_paths = {
      "build-id":"$.detail.build-id",
      "project-name":"$.detail.project-name",
      "build-status":"$.detail.build-status"
    }
    input_template = "\"Build '<build-id>' for build project '<project-name>' has reached the build status of '<build-status>'.\""
  }
}
