include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/artifact_registry/"
}
inputs = {
    repositories = [
    {
      repository_id   = "tefst-apdi"
      repo_format = "DOCKER"
      location    = "us-central1"
      repo_mode   = "STANDARD_REPOSITORY"

      cleanup_policies = [
      {
        id     = "delete-older-than-15"
        action = "DELETE"
        condition = {
          tag_state  = "ANY"
          older_than = "15d"
        }
      },
      {
        id     = "keep-recent-50"
        action = "KEEP"
        most_recent_versions = {
          keep_count = 50
        }
      }
      ]
    },
    {
      repository_id   = "aasdfifdi"
      repo_format = "DOCKER"
      location    = "us"
      repo_mode   = "STANDARD_REPOSITORY"

      cleanup_policies = [
      {
        id     = "delete-older-than-15"
        action = "DELETE"
        condition = {
          tag_state  = "ANY"
          older_than = "15d"
        }
      },
      {
        id     = "keep-recent-50"
        action = "KEEP"
        most_recent_versions = {
          keep_count = 50
        }
      }
      ]
    },
    {
      repository_id   = "metricfdss"
      repo_format = "DOCKER"
      location    = "us"
      repo_mode   = "STANDARD_REPOSITORY"

      cleanup_policies = [
      {
        id     = "delete-older-than-15"
        action = "DELETE"
        condition = {
          tag_state  = "ANY"
          older_than = "15d"
        }
      },
      {
        id     = "keep-recent-50"
        action = "KEEP"
        most_recent_versions = {
          keep_count = 100
        }
      }
      ]
    }
  ]
}
