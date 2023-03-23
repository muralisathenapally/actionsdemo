terraform {
  backend "gcs" {
    bucket  = "tetykgo76"
    prefix  = "demo1/state"
  }
}