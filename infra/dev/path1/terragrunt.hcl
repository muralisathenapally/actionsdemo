terraform {
  source = "../../../modules/gcs"
}

inputs = {
  name                    = "sfjno-murali-acfcgess-dbucket"
  location                = "US"
  force_destroy           = true
  public_access_prevention = "enforced"
}
