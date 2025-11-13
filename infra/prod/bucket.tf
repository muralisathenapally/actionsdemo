resource "google_storage_bucket" "auto-expire" {
  name          = "msrtlh-ne-no-pubglisdfgsdfgc-access-bucket"
  project = "psyched-circuit-405312"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
####
