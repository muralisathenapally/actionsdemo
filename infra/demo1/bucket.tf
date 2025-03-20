resource "google_storage_bucket" "auto-expire" {
  name          = "msrth-ne-no-public-access-bucket"
  project = "psyched-circuit-405312"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
####
