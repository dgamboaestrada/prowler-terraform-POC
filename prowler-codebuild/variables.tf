variable "prefix" {
  description = "(Optional) A prefix for all names resource of the module"
  type        = string
  default     = ""
}

variable "description" {
  description = "(Optional) Description for the codebuild resource"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) A map of tags to attach to the build project"
  type        = map(string)
  default     = {
    Project = "Prowler"
  }
}

variable "cloudwatch_logs_status" {
  type        = string
  description = "(Optional) Enable or diable cloudwatch logs. Values: ENABLED, DISABLED."
  default     = "ENABLED"
}

variable "log_group" {
  type        = string
  description = "(Optional) The group name of the logs in CloudWatch Logs."
  default     = "codebuild-prowler"
}

variable "log_stream" {
  type        = string
  description = "(Optional) The stream name of the logs in CloudWatch Logs."
  default     = "log-stream"
}

variable "s3_logs_status" {
  type        = string
  description = "(Optional) Enable or diable s3 logs. Values: ENABLED, DISABLED."
  default     = "DISABLED"
}

variable "build_timeout" {
  type        = string
  description = "(Optional) How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed."
  default     = "5"
}

variable "prowler_options" {
  description = "(Optional) A set of environment variables to make available to builds for this build project"
  type        = string
  default     = "-f us-east-1 -c check12,check15,check16 -M html,json,text,junit-xml"
}

variable "compute_type" {
  description = "Information about the compute resources the build project will use"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "codebuild_image" {
  description = "The Docker image to use for this build project"
  type        = string
  default     = "aws/codebuild/standard:3.0"
}
