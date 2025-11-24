remote_state {
  backend = "gcs"
  config = {
    bucket  = "sfjno-murali-acfcgess-dbucket"
    prefix  = "${path_relative_to_include()}"
  }
}

inputs = {
  location                  = "us-central1"
  #project_id                = "my-test-project"
  release_channel           = "REGULAR"
  node_locations            = ["us-central1-c"]
}
