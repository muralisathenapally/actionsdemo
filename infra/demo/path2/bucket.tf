module "gcs_buckets" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=artifact_registry"
  project_id  = "rare-daylight-390015"
  names = ["msirstbtgsk", "mseconndkbtfy"]
  versioning = {
    first = true
  }
}

