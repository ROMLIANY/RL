provider "google" {
  credentials = jsondecode(var.gcp_credentials_json)
  project     = var.project_id
  region      = var.region
}
