resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.zone
  network            = "default"
  remove_default_node_pool = true
  deletion_protection = false
  initial_node_count = 1

  lifecycle {
    ignore_changes = [node_config]
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 20
    preemptible  = false
  }
}
