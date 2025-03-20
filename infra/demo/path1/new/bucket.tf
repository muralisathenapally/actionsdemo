resource "google_storage_bucket" "auto-expire" {
  name          = "msqtps-twon-no-public-access-bucket"
  project = "united-lane-354904"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "auto-expire-1" {
  name          = "msqqdqq-twon-no-public-access-bucket"
  project = "united-lane-354904"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
