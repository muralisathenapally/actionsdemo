terraform {
  source = "../../../modules/gcs"
}

inputs = {
  name                    = "thr-sfno-pkublisdfgtgc-acfcgess-dbucket"
  location                = "US"
  force_destroy           = true
  public_access_prevention = "enforced"
}
