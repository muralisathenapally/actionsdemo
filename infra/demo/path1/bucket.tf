resource "google_storage_bucket" "auto-expire" {
  name          = "ms-thre-no-public-access-bucke"
  project = "nited-lane-354904"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
