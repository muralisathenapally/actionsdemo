module "gcs_buckets" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=gcs"
  project_id  = "psyched-circuit-405312"
  names = ["msirstbtgsk", "msecnnkdkbtfy"]
  versioning = {
    first = true
  }
}

