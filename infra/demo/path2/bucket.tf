module "gcs_buckets" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=artifact_registry"
  project_id  = "united-lane-354904"
  names = ["msfirstbktgu", "mssecondbktfyu"]
  versioning = {
    first = true
  }
}

