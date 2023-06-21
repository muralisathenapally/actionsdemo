module "gcs_buckets" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=gcs"
  project_id  = "rare-daylight-390015"
  names = ["msirstbtgsk", "msecnnkdkbtfy"]
  versioning = {
    first = true
  }
}

