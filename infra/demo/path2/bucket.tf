module "gcs_buckets" {
  source     = "https://github.com/muralisathenapally/tfm.git?ref=artifact_registry"
  project_id  = "united-lane-354904"
  names = ["msfirstbkt", "mssecondbkt"]
  versioning = {
    first = true
  }
}

