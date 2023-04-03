resource "google_storage_bucket" "auto-expire" {
  name          = "msaa-two-no-public-access-bucket"
  project = "united-lane-354904"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
