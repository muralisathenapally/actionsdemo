terraform {
  backend "gcs" {
    bucket  = "tetykgo76"
    prefix  = "path1/new/state"
  }
}