resource "google_storage_bucket" "auto-expire" {
  name          = var.name
  project       = var.project
  location      = var.location
  force_destroy = var.force_destroy

  public_access_prevention = var.public_access_prevention
}
