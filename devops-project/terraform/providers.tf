provider "google" {
  credentials = file("/tmp/gcp_credentials.json")
  project     = "windy-gearbox-451911-s2"
  region      = "us-east1"
}
