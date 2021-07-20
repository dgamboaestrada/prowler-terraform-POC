## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| prefix | A prefix for all names resource of the module | string | "" | no |
| tags | A map of tags to assign to the object | map | {} | no |
| schedule_expression | (Optional) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required | string | rate(1 hour) | no |
| codebuild_project_id | The codebuild project id to trigger | string | null | yes |
| codebuild_project_arn | The codebuild project arn to trigger | string | null | yes |
| logs_retention_in_days | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire | string | rate(24 hours) | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The name of the rule |
| arn | The Amazon Resource Name (ARN) of the rule |
| lambda_arn | The Amazon Resource Name (ARN) identifying your Lambda Function |
| lambda_function_name | The name of the Lambda Function |
| role_id | The ID of the Lambda IAM role |
