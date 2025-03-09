provider "google" {
  credentials = file("${path.module}/gcp-key.json")
  project     = "windy-gearbox-451911-s2"
  region      = "us-east1"
}