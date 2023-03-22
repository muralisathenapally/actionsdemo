resource "google_storage_bucket" "auto-expire" {
  name          = "ms-ones-no-public-access-bucke"
  project = "united-lane-354904"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
