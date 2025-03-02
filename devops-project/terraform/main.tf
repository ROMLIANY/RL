resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
