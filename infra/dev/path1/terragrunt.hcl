terraform {
  source = "../../../modules/gcs"
}

inputs = {
  name                    = "sfno-murali-acfcgess-dbucket"
  location                = "US"
  force_destroy           = true
  public_access_prevention = "enforced"
}
