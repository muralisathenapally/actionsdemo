terraform {
  backend "gcs" {}
}
resource "google_artifact_registry_repository" "artifact_registry_repo" {
  for_each = { for repo in var.repositories : repo.repository_id => repo }

  repository_id          = each.value.repository_id
  project                = var.project_id
  format                 = each.value.repo_format
  location               = each.value.location
  mode                   = try(each.value.repo_mode, "STANDARD_REPOSITORY")
  cleanup_policy_dry_run = false
  labels = {
   label = "managed-by-terraform"
  }

  dynamic "cleanup_policies" {
    for_each = each.value.cleanup_policies
    content {
      id     = cleanup_policies.value.id
      action = cleanup_policies.value.action

      dynamic "condition" {
        for_each = cleanup_policies.value.condition == null ? [] : [cleanup_policies.value.condition]
        content {
          tag_state  = try(condition.value.tag_state, null)
          older_than = try(condition.value.older_than, null)
        }
      }

      dynamic "most_recent_versions" {
        for_each = cleanup_policies.value.most_recent_versions == null ? [] : [cleanup_policies.value.most_recent_versions]
        content {
          keep_count = most_recent_versions.value.keep_count
        }
      }
    }
  }
}
