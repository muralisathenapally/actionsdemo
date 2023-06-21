module "gcs_buckets" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=artifact_registry"
  project_id  = "united-lane-354904"
  names = ["msirstbtgsk", "mseconndkbtfy"]
  versioning = {
    first = true
  }
}

