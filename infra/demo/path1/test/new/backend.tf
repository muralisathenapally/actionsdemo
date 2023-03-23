terraform {
  backend "gcs" {
    bucket  = "tetykgo76"
    prefix  = "test/new/state"
  }
}