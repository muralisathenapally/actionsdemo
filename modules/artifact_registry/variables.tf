variable "repositories" {
  description = "List of artifact registry repositories with cleanup policies"
  type = list(object({
    repository_id = string
    repo_format   = string
    location      = string
    repo_mode     = optional(string, "STANDARD_REPOSITORY")
    cleanup_policies = list(object({
      id     = string
      action = string
      condition = optional(object({
        tag_state  = optional(string)
        older_than = optional(string)
      }))
      most_recent_versions = optional(object({
        keep_count = number
      }))
    }))
  }))
}

variable "project_id" {}
