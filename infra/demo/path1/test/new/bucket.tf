resource "google_storage_bucket" "auto-expire" {
  name          = "ms-two-no-public-access-bucke"
  project = "united-lane-354904"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
