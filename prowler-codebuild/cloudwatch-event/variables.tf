variable "prefix" {
  description = "(Optional) A prefix for all names resource of the module"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Required) A map of tags to assign to the object"
  type        = map(string)
}

variable "schedule_expression" {
  description = "(Optional) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required"
  type        = string
  default     = "rate(1 hour)"
}

variable "codebuild_project_id" {
  description = "(Required) The codebuild project id to trigger."
  type        = string
}

variable "codebuild_project_arn" {
  description = "(Required) The codebuild project arn to trigger."
  type        = string
}

variable "logs_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire"
  type        = number
  default     = null
}
