terraform {
  backend "gcs" {
    bucket  = "ahsfhasfjhndcxd"
    prefix  = "demo1/state"
  }
}