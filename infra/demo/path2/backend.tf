terraform {
  backend "gcs" {
    bucket  = "tetykgo76"
    prefix  = "path2/state"
  }
}