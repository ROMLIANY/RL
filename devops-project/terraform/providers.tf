provider "google" {
  credentials = file("gcp-key.json")
  project     = "windy-gearbox-451911-s2"
  region      = "us-east1"
}
