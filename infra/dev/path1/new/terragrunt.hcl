terraform {
  source = "../../../../modules/gcs"
}

inputs = {
  name                    = "ffr-no-publiasdfc-access-bucket"
  project                 = "psyched-circuit-405312"
  location                = "US"
  force_destroy           = true
  public_access_prevention = "enforced"
}
