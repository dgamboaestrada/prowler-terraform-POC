variable "prefix" {
  description = "(Optional) A prefix for all names resource of the module"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Required) A map of tags to assign to the object"
  type        = map(string)
}

variable "codebuild_project_name" {
  description = "(Required) The codebuild project name of prowler"
  type        = string
}

variable "email" {
  description = "(Required) The email to send the notification"
  type        = string
}
