resource "google_container_cluster" "primary" {
  name     = "devops-cluster"
  location = "us-central1"

  # Authentication configuration for the Kubernetes master
  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }

  # Node pool configuration
  node_pool {
    name       = "primary-node-pool"
    node_count = 3

    node_config {
      machine_type = "e2-medium"
      disk_size_gb = 20
    }
  }

  # Enable Shielded Nodes for added security
  enable_shielded_nodes = true
}
